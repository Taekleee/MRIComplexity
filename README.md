# MRIComplexity

## Prerequisitos 
Se debe tener instalada la librería remotes [https://cran.r-project.org/web/packages/remotes/index.html]

## Instalar librería 

Para realizar la instalación, se debe utilizar el comando install_github con el nombre del usuario creador de la librería (Taekleee) y el nombre de la librería (MRIComplexity), como se detalla en la imagen que se encuentra a continuación.
![instalación](https://user-images.githubusercontent.com/44279550/227102172-115170a2-142e-4500-a3aa-52be8f5cecfd.png)


## Descripción de la librería 

En Rstudio es posible obtener la descripción de las funciones existentes en la librería mediante Help. 

![help](https://user-images.githubusercontent.com/44279550/227102931-b73e57b5-dc20-4778-b981-7c9311c9b571.png)


## Contenido 

Las funciones existentes en la librería que permiten calcular complejidades y entropías son: 

- pe (Entropía permutada)
- lzc (complejidad de Lempel Ziv)
- lempel.ziv (Complejidad de Lempel Ziv normalizada)
- plzc (Complejidad de Lempel Ziv permutada)

Las funciones existente con respecto al manejo de las MRI en formato NIFTI son: 

- calculateEntropyComplexity (aplica lzc o pe a la MRI)
