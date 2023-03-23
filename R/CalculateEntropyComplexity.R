library(stringr)
library(oro.nifti)

calculateEntropyComplexity <- function( src.image.file,
                                        entropyComplexity,
                                        lengthSignal,
                                        embdim = 2
){
  splitName <- str_split(src.image.file, ".nii.gz")
  splitFinalName <- str_split(splitName[[1]][1], "Signal-change-V1")
  src.image <- readNIfTI(src.image.file)
  print("Archivo leído")
  dims <- as.list(src.image@dim_[2:5])
  names(dims) <- c("x", "y", "z", "t")
  newImage <- readNIfTI(str_c(getwd(),"/mri_empty.nii.gz"))
  print("Se abre mri_empty")
  datatype(newImage) <- 16 #Datatype float32
  bitpix(newImage)<- 32

  for(z in 1:dims$z)
  {
    for(y in 1:dims$y)
    {
      for(x in 1:dims$x)
      {
        if(sum(src.image[x, y, z,]) == 0){
          newImage[x,y,z] = 0
        } else{
          if(entropyComplexity == 'lzc'){
            newImage[x,y,z] = lzc(src.image[x, y, z,0:lengthSignal])
          }
          else if(entropyComplexity == 'pe'){
            newImage[x,y,z] = pe(src.image[x, y, z,0:lengthSignal], embdim)

          }
          newImage[x,y,z] = mean(src.image[x, y, z,0:lengthSignal])
        }
      }
    }
  }
  splitName <- str_split(src.image.file, ".nii.gz")
  newName <- str_c(getwd(), splitFinalName[[1]][2],"-",entropyComplexity)
  fname = file.path(newName)
  print("Escribiendo archivo")
  print(fname)
  writeNIfTI(newImage, fname, verbose=TRUE)
}

#calculateEntropyComplexity(src.image.file =  "C002-run2-ICBM152-225mm-Brain-dilated-signalchange.nii.gz", entropyComplexity = "ent", embdim = 2)
