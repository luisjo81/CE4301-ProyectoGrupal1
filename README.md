# Diseño e Implementación de un ASIP para interpolación de imágenes
CE4301 Arquitectura de Computadores I 

## Descripción
Esta aplicación se encarga de aplicar un algoritmo de interpolación a imágenes, utilizando un procesador con pipelining y su propio ISA, ambos diseñados por el grupo. 

## Contenidos
- [:clipboard: Requisitos](#requisitos)
- [:computer: Ejecución](#ejecución)
- [:green_book: Green Card](#greencard)
- [:floppy_disk: Instrucciones](instrucciones)
- [:chart_with_upwards_trend: Algoritmo de Interpolación](#algoritmo)
- [:x: Limitaciones](#limitaciones)
- [:email: Autores](#autores)

## :clipboard: Requisitos
- La aplicación fue desarrollada en un sistema Windows (10 / 11). No se asegura un correcto funcionamiento de la aplicación en otro sistema.
- Para la creación del procesador y las respectivas pruebas de sus componentes, se crearon módulos en System Verilog utilizando [Quartus Prime](https://www.intel.com/content/www/us/en/collections/products/fpga/software/downloads.html?s=Newest) 20.1, con configuración para una placa Terasic DE1-
SoC-M TL2. 
- Para crear el compilador encargado de traducir las instrucciones del ISA se utilizó [Python](https://www.python.org/) 3.8.10. Este también se utiliza para la aplicación encargada de aplicar el algoritmo de interpolación.
- Se requiere un archivo .txt que contenga las instrucciones del ISA a ejecutar según el formato establecido.
- La imagen a procesar debe estar en escala de grises. 

## :computer: Ejecución
- El primer paso es ejecutar el archivo Compilador.py, el cual se va a encargar de parsear las instrucciones del ISA para que puedan ser revisadas por el porcesador.
- Una vez se haya ejecutado correctamente el compilador, este habrá generado un archivo llamado parsedInst.txt, el cual contiene los bitstreams requeridos por el procesador para hacer los cálculos.  

## :green_book: Green Card
A continuación se muestra el Green Card para el ISA propuesto:

## :floppy_disk: Instrucciones
Como se mencionó en la sección de requisitos, se requiere un archivo .txt con las instrucciones a ejecutar. En este caso, las instrucciones son muy específicas, ya que lo que se busca es el correcto procesamiento de la imagen. Se incluye un archivo llamado Instructions.txt, el cual contiene las siguientes instrucciones:

## :chart_with_upwards_trend: Algoritmo de Interpolación
El procesamiento de la imagen

## :x: Limitaciones
- 
- 
- 

## :email: Autores
**Kevin Gónzalez Sanabria**
- [Github](https://github.com/kgonzalez712)
- [Email](mailto:dev.kvn95@gmail.com?subject=Hi "Hi!")

**Luis Martínez Ramírez**
- [Github](https://github.com/luisjo81)
- [Email](mailto:louisjo81@gmail.com?subject=Hi "Hi!")

**Mariano Muñoz Masís**
- [Github](https://github.com/MarianoIDC)
- [Email](mailto:marianomm1301@gmail.com?subject=Hi "Hi!")

**Luis Prieto Sibaja**
- [Github](https://github.com/Java-Sith)
- [Email](mailto:prieto.luisdaniel@gmail.com?subject=Hi "Hi!")
