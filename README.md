# Diseño e Implementación de un ASIP para Interpolación de Imágenes
CE4301 Arquitectura de Computadores I 

## Descripción
Esta aplicación se encarga de aplicar un algoritmo de interpolación a imágenes, utilizando un procesador con pipelining y su propio ISA, ambos diseñados por el grupo. 

## Contenidos
- :clipboard: Requisitos
- :computer: Ejecución
- :green_book: Green Card
- :floppy_disk: Instrucciones
- :x: Limitaciones
- :email: Autores

## :clipboard: Requisitos
- La aplicación fue desarrollada en un sistema Windows (10 / 11). No se asegura un correcto funcionamiento de la aplicación en otro sistema.
- Para la creación del procesador y las respectivas pruebas de sus componentes, se crearon módulos en System Verilog utilizando [Quartus Prime](https://www.intel.com/content/www/us/en/collections/products/fpga/software/downloads.html?s=Newest) 20.1, con configuración para una placa Terasic DE1-
SoC-M TL2. 
- Para crear el compilador encargado de traducir las instrucciones del ISA se utilizó [Python](https://www.python.org/) 3.8.10. Este también se utiliza para el programa
- Se requiere un archivo .txt que contenga las instrucciones del ISA a ejecutar según el formato establecido.
- Se necesita una imagen sobre la cual aplicar el algoritmo. 

## :computer: Ejecución
- El primer paso es ejecutar el archivo Compilador.py, el cual se va a encargar de parsear las instrucciones del ISA para que puedan ser revisadas por el porcesador.
- Una vez se haya ejecutado correctamente el compilador, este habrá generado un archivo llamado parsedInst.txt, el cual contiene los bitstreams requeridos por el procesador para hacer los cálculos. Posteriormente, estos datos deberán ser cargados en la ROM del procesador.  

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

```assembly
/CONTADOR DE LECTURA R29 
MOVI R29,0
NOP

/CONTADOR DE ESCRITURA R27 
MOVI R27,126
NOP
MOVI R12, 250
NOP

top:
/R28 CONTIENE EL BITSTREAM DE 32BITS DE MEMORIA
LDR R28,0(R29)
NOP
NOP
NOP
LNUM R22,R28,1
LNUM R23,R28,2
LNUM R24,R28,3
LNUM R25,R28,4

/ALGORITMO DE INTERPOLACION
/Calcula el punto A
MULI R8,R22,2
NOP
NOP
NOP
ADD R9,R8,R23
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto B
MULI R8,R23,2
NOP
NOP
NOP
ADD R9,R8,R22
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto C
MULI R8,R22,2
NOP
NOP
NOP
ADD R9,R8,R24
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
MOV R16,R0
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto F
MULI R8,R23,2
NOP
NOP
NOP
ADD R9,R8,R25
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
MOV R15,R0
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto D
MULI R8,R16,2
NOP
NOP
NOP
ADD R9,R8,R15
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto E
MULI R8,R15,2
NOP
NOP
NOP
ADD R9,R8,R16
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto G
ptG:
MULI R8,R24,2
NOP
NOP
NOP
ADD R9,R8,R22
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
MOV R16,R0
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto J
MULI R8,R25,2
NOP
NOP
NOP
ADD R9,R8,R23
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
MOV R15,R0
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto H
MULI R8,R16,2
NOP
NOP
NOP
ADD R9,R8,R15
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto I
MULI R8,R15,2
NOP
NOP
NOP
ADD R9,R8,R16
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto K
MULI R8,R24,2
NOP
NOP
NOP
ADD R9,R8,R25
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
STR R0,0(R27)
ADDI R27,R27,1

/Calcula el punto L
ptL:
MULI R8,R25,2
NOP
NOP
NOP
ADD R9,R8,R24
NOP
NOP
NOP
DIV R0,R9,3
NOP
NOP
NOP
STR R0,0(R27)
ADDI R27,R27,1

/FINAL DEL ALGORITMO
ADDI R29,R29,1
NOP
NOP 
NOP
/CONDICION DE PARADA
JLT R29,R12,top: 
MULI R26,R12,1
FIN
```

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
