import os

arithmeticOpList = ['ADD', 'ADDI', 'SUB', 'SUBI', 'MUL', 'MULI', 'MOV', 'MOVI']
logicOpList = ['AND', 'ANDI', 'OR', 'ORI', 'XOR', 'NOT', 'CMP']
memoryOpList = ['LDR', 'LDA', 'STR']
jumpOpList = ['JMP', 'JEQ', 'JNEQ', 'JGT', 'JGE', 'JLT', 'JLE']
registersList = ['R0', 'R1', 'R2', 'R3', 'R4', 'R5', 'R6', 'R7', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'R16', 'R17', 'R18', 'R19', 'R20', 'R21', 'R22', 'R23', 'R24', 'R25', 'R26', 'R27', 'R28', 'R29', 'R30', 'R31']
instructionsList = []
bitstreamLen = 20

#Función principal que se encarga de leer el archivo con las intrucciones y las almacena en una lista
def readFile():
    file = open('Instructions.txt', 'r')
    print("File opened")
    print("....................................")
    tempList = []
    global instructionsList
    for row in file.readlines():
        tempList = tempList + [row]
        #print (row)
    instructionsList = tempList
    print("Instructions read")
    print(instructionsList)
    print("....................................")
    file.close()
    return

#Función que elimina los saltos de línea de las instrucciones (\n)
def deleteEndOfLine():
    tempList = []
    cont = 1
    global instructionsList
    for i in instructionsList:
        if len(instructionsList) == cont:
            tempList = tempList + [i]
        else:
            tempList = tempList + [i[0:-1]]
            cont += 1
    instructionsList = tempList
    print("Ends of line deleted")
    print(instructionsList)
    print("....................................")
    return

#Función que separa una instrucción en elementos de una lista
def instructionToList(instruction):
    instructionList = []
    word = ''
    for i in instruction:
        if (i == ' ') or (i == ','):
            instructionList = instructionList + [word]
            word = ''
        else:
            word = word + i
    instructionList = instructionList + [word]
    return instructionList

    
#Función que revisa si una palabra corresponde a un mnemónico válido para operación
def checkOperationType(word): 
    for a in arithmeticOpList:
        if a == word:
            return 1
    for l in logicOpList:
        if l == word:
            return 2
    for m in memoryOpList:
        if m == word:
            return 3
    for j in jumpOpList:
        if j == word:
            return 4
    return 5

#Función que revisa si una palabra corresponde a un mnemónico válido para registros
def checkRegister(word): 
    for i in registersList:
        if i == word:
            return True
    return False

#Función que se encarga de evaluar si el dato ingresado es un inmediato (número entero)
def checkInmediate(data):
    try:
        num = int(data)
        return True
    except:
        return False

#Función lambda para convertir un entero decimal a binario
intToBinary = lambda x, n: format(x, 'b').zfill(n)

#Función que parsea una operación a binario
def parseOperation(operation):
    if operation == 'ADD':
        return '000000'
    if operation == 'ADDI':
        return '000001'
    if operation == 'SUB':
        return '000010'
    if operation == 'SUBI':
        return '000011'
    if operation == 'MUL':
        return '000100'
    if operation == 'MULI':
        return '000101'
    if operation == 'MOV':
        return '000110'
    if operation == 'MOVI':
        return '000111'
    if operation == 'AND':
        return '010000'
    if operation == 'ANDI':
        return '010001'
    if operation == 'OR':
        return '010010'
    if operation == 'ORI':
        return '010011'
    if operation == 'XOR':
        return '010100'
    if operation == 'NOT':
        return '010101'
    if operation == 'CMP':
        return '010110'
    if operation == 'LDR':
        return '100000'
    if operation == 'LDA':
        return '100001'
    if operation == 'STR':
        return '100010'
    if operation == 'JMP':
        return '110000'
    if operation == 'JEQ':
        return '110001'
    if operation == 'JNEQ':
        return '110010'
    if operation == 'JGT':
        return '110011'
    if operation == 'JGE':
        return '110100'
    if operation == 'JLT':
        return '110101'
    if operation == 'JLE':
        return '110110'

#Función que parsea un registro a binario
def parseRegister(register):
    if register == 'R0':
        return '00000'
    if register == 'R1':
        return '00001'
    if register == 'R2':
        return '00010'
    if register == 'R3':
        return '00011'
    if register == 'R4':
        return '00100'
    if register == 'R5':
        return '00101'
    if register == 'R6':
        return '00110'
    if register == 'R7':
        return '00111'
    if register == 'R8':
        return '01000'
    if register == 'R9':
        return '01001'
    if register == 'R10':
        return '01010'
    if register == 'R11':
        return '01011'
    if register == 'R12':
        return '01100'
    if register == 'R13':
        return '01101'
    if register == 'R14':
        return '01110'
    if register == 'R15':
        return '01111'
    if register == 'R16':
        return '10000'
    if register == 'R17':
        return '10001'
    if register == 'R18':
        return '10010'
    if register == 'R19':
        return '10011'
    if register == 'R20':
        return '10100'
    if register == 'R21':
        return '10101'
    if register == 'R22':
        return '10110'
    if register == 'R23':
        return '10111'
    if register == 'R24':
        return '11000'
    if register == 'R25':
        return '11001'
    if register == 'R26':
        return '11010'
    if register == 'R27':
        return '11011'
    if register == 'R28':
        return '11100'
    if register == 'R29':
        return '11101'
    if register == 'R30':
        return '11110'
    if register == 'R31':
        return '11111'

#Función que indica cuántos registros utiliza una instrucción
def getNumberOfRegisters(operation):
    if operation == 'ADD' or operation == 'SUB' or operation == 'MUL' or operation == 'AND' or operation == 'OR' or operation == 'XOR' or operation == 'CMP':
        return 3
    elif operation == 'ADDI' or operation == 'SUBI' or operation == 'MULI' or operation == 'MOV' or operation == 'ANDI' or operation == 'ORI' or operation == 'NOT':
        return 2
    elif operation == 'LDR' or operation == 'LDA' or operation == 'STR' or operation == 'MOVI':
        return 1
    else:
        return 0

#Función que indica si la operación tiene un valor inmediato
def haveInmediates(operation):
    if operation == 'ADDI' or operation == 'SUBI' or operation == 'MULI' or operation == 'MOVI' or operation == 'ANDI' or operation == 'ORI' or operation == 'LDR' or operation == 'LDA' or operation == 'STR':
        return True
    else:
        return False

#Función que verifica si una instrucción tiene una sintáxis correcta y genera el bitstream
def parseInstruction(instruction):
    bitstreamOk = True
    bitstream = ''
    opType = ''
    flagOperation = False
    flagInmediate = False
    flagData = False
    registerCounter = 0
    for i in instruction:
        dataType = checkOperationType(i)
        print ("Data type: " + str(dataType))
        if (dataType != 5) and (flagOperation == False):
            opType = i
            print ("Operation detected: " + opType)
            flagOperation = True
            flagInmediate = haveInmediates(i)
            print ("Inmediate value expected: " + str(flagInmediate))
            registerCounter = getNumberOfRegisters(i)
            print ("Registers expected: " + str(registerCounter))
            bitstream = parseOperation(i)
            print ("Parsed operation: " + bitstream)
            if registerCounter == 3:
                flagData = True
        elif (dataType == 5) and (flagOperation == True):
            if registerCounter != 0:
                if (checkRegister(i) == True):
                    print ("Register " + i + ": Correct")
                    bitstream = bitstream + ' ' + parseRegister(i)
                    registerCounter -= 1
                    print("Parsed register " + i + ": " + parseRegister(i))
                    print ("Expected registers left: " + str(registerCounter))
                else:
                    print ("ERROR: valid register value expected")
                    bitstreamOk = False
            if (flagInmediate == True) and (checkInmediate(i) == True):
                inmediateValue = intToBinary(int(i), 5)
                print ("Inmediate value: " + inmediateValue)
                bitstream = bitstream + ' ' + inmediateValue
                flagInmediate = False
            #caso para los jumps
            #elif 
               
        else:
            print ("ERROR: wrong instruction syntax")
            bitstreamOk = False

    if flagData == True:
        return bitstream + ' 0'

    return bitstream
    
#print (parseInstruction(['AND', 'R1', 'R25' , 'R19']))
#readFile()
#deleteEndOfLine()
