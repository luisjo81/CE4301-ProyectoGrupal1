# Diseño e Implementación de un ASIP para Interpolación de Imágenes
CE4301 Arquitectura de Computadores I 

## Descripción
Esta aplicación se encarga de aplicar un algoritmo de interpolación a imágenes, utilizando un procesador con pipelining y su propio ISA, ambos diseñados por el grupo. 

## Contenidos
- [:clipboard: Requisitos](#requisitos)
- [:computer: Ejecución](#ejecución)
- [:green_book: Green Card](#greencard)
- [:floppy_disk: Instrucciones](#instrucciones)
- [:chart_with_upwards_trend: Algoritmo de Interpolación](#algoritmo)
- [:x: Limitaciones](#limitaciones)
- [:email: Autores](#autores)

## :clipboard: Requisitos
- La aplicación fue desarrollada en un sistema Windows (10 / 11). No se asegura un correcto funcionamiento de la aplicación en otro sistema.
- Para la creación del procesador y las respectivas pruebas de sus componentes, se crearon módulos en System Verilog utilizando [Quartus Prime](https://www.intel.com/content/www/us/en/collections/products/fpga/software/downloads.html?s=Newest) 20.1, con configuración para una placa Terasic DE1-
SoC-M TL2. 
- Para crear el compilador encargado de traducir las instrucciones del ISA se utilizó [Python](https://www.python.org/) 3.8.10. Este también se utiliza para el programa
- Se requiere un archivo .txt que contenga las instrucciones del ISA a ejecutar según el formato establecido.
- Se necesita una imagen sobre la cual aplicar el algoritmo. 

## :computer: Ejecución
- El primer paso es ejecutar el archivo Compilador.py, el cual se va a encargar de parsear las instrucciones del ISA para que puedan ser revisadas por el porcesador.
- Una vez se haya ejecutado correctamente el compilador, este habrá generado un archivo llamado parsedInst.txt, el cual contiene los bitstreams requeridos por el procesador para hacer los cálculos.  

## :green_book: Green Card
A continuación se muestra el Green Card para el ISA propuesto. El mismo cuenta con tres secciones:
- La división del bitstream para cada una de las instrucciones.
![](/Assets/GreenCard1.PNG)
- Estructura de los bits del opcode para cada instrucción, así como su nombre, estructura y resumen.
![](/Assets/GreenCard2.PNG)
- Distribución de los registros con su número, mnemónico y su función.
![](/Assets/GreenCard3.PNG)

## :floppy_disk: Instrucciones
Como se mencionó en la sección de requisitos, se requiere un archivo .txt con las instrucciones a ejecutar. En este caso, las instrucciones son muy específicas, ya que lo que se busca es el correcto procesamiento de la imagen. Se incluye un archivo llamado Instructions.txt, el cual contiene las siguientes instrucciones:

## :chart_with_upwards_trend: Algoritmo de Interpolación
El procesamiento de la imagen

## :x: Limitaciones
A continuación se presentan algunas instrucciones que deben de seguirse con el fin de que el programa funcione de la manera correcta:
- Programa escrito con las instrucciones del ISA:
  - Si en algún momento se requiere realizar un salto a un branch, este branch debe de haber sido creado previamente.
  - Al utilizar una instrucción MOV, inmediatamente se debe colocar una instrucción NOP en la siguiente línea. Esto se hace con el fin de que el pipeline pueda procesar los datos correctamente.
  - La instrucción NOP también se utiliza para el manejo de riesgo de datos.
  - El ISA no tiene implementados comentarios, por lo cual si se intenta colocar uno, el compilador lo interpretará como un branch.
  - No se deben colocar líneas en blanco.
  - En la última línea, se debe escribir la palabra FIN, de modo que el compilador sepa que ahí finaliza el programa.
  - Las instrucciones deben estar escritas en un archivo de tipo txt con el nombre Instructions.txt, de lo contrario el compilador no podrá generar el binario para el procesador. 
- Imagen de entrada:
  - La imagen debe tener un tamaño máximo de 250x250 píxeles.
  - La imagen debe de estar en escala de grises.

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
