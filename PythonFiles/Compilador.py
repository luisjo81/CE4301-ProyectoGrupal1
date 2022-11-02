arithmeticOpList = ['NOP', 'ADD', 'ADDI', 'SUB', 'SUBI', 'MULI', 'DIV', 'MOV', 'MOVI', 'LNUM', 'ADDV', 'ADDIV', 'SUBV', 'SUBIV', 'MULIV', 'DIVV', 'MOVV', 'MOVIV', 'LNUMV']
logicOpList = ['AND', 'ANDI', 'OR', 'ORI', 'XOR', 'NOT', 'ANDV', 'ANDIV', 'ORV', 'ORIV', 'XORV', 'NOTV']
memoryOpList = ['LDR', 'STR', 'LDV', 'STV']
jumpOpList = ['JMP', 'JEQ', 'JNEQ', 'JGT', 'JGE', 'JLT', 'JLE']
escalarRegistersList = ['R0', 'R1', 'R2', 'R3', 'R4', 'R5', 'R6', 'R7', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'R16', 'R17', 'R18', 'R19', 'R20', 'R21', 'R22', 'R23', 'R24', 'R25', 'R26', 'R27', 'R28', 'R29', 'R30', 'R31']
vectorialRegistersList = ['VR0', 'VR1', 'VR2', 'VR3', 'VR4', 'VR5', 'VR6', 'VR7', 'VR8', 'VR9', 'VR10', 'VR11', 'VR12', 'VR13', 'VR14', 'VR15', 'VR16', 'VR17', 'VR18', 'VR19', 'VR20', 'VR21', 'VR22', 'VR23', 'VR24', 'VR25', 'VR26', 'VR27', 'VR28', 'VR29', 'VR30', 'VR31']
instructionsList = []
instructionLines = {}

#Función principal que se encarga de leer el archivo con las intrucciones y las almacena en una lista
def readFile():
    file = open('../Program/InstructionsTest.txt', 'r')
    print("File opened")
    print("....................................")
    tempList = []
    global instructionsList
    for row in file.readlines():
        tempList = tempList + [row]
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
            break
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
    for i in escalarRegistersList:
        if i == word:
            return True
    for i in vectorialRegistersList:
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
    if operation == 'NOP':
        return '0000000'
    if operation == 'ADD':
        return '0000001'
    if operation == 'ADDI':
        return '0001001'
    if operation == 'SUB':
        return '0000010'
    if operation == 'SUBI':
        return '0001010'
    if operation == 'MULI':
        return '0001011'
    if operation == 'DIV':
        return '0001101'
    if operation == 'MOV':
        return '0000100'
    if operation == 'MOVI':
        return '0001100'
    if operation == 'LNUM':
        return '0001110'
    if operation == 'AND':
        return '0100001'
    if operation == 'ANDI':
        return '0101001'
    if operation == 'OR':
        return '0100010'
    if operation == 'ORI':
        return '0101010'
    if operation == 'XOR':
        return '0100011'
    if operation == 'NOT':
        return '0100100'
    if operation == 'LDR':
        return '1001001'
    if operation == 'STR':
        return '1001011'
    if operation == 'JMP':
        return '1101000'
    if operation == 'JEQ':
        return '1101001'
    if operation == 'JNEQ':
        return '1101010'
    if operation == 'JGT':
        return '1101011'
    if operation == 'JGE':
        return '1101100'
    if operation == 'JLT':
        return '1101101'
    if operation == 'JLE':
        return '1101110'
    if operation == 'ADDV':
        return '0010001'
    if operation == 'ADDIV':
        return '0011001'
    if operation == 'SUBV':
        return '0010010'
    if operation == 'SUBIV':
        return '0011010'
    if operation == 'MULIV':
        return '0011011'
    if operation == 'DIVV':
        return '0011101'
    if operation == 'MOVV':
        return '0010100'
    if operation == 'MOVIV':
        return '0011100'
    if operation == 'LNUMV':
        return '0011110'
    if operation == 'ANDV':
        return '0110001'
    if operation == 'ANDIV':
        return '0111001'
    if operation == 'ORV':
        return '0110010'
    if operation == 'ORIV':
        return '0111010'
    if operation == 'XORV':
        return '0110011'
    if operation == 'NOTV':
        return '0110100'
    if operation == 'LDV':
        return '1011001'
    if operation == 'STV':
        return '1011011'

#Función que parsea un registro a binario
def parseRegister(register):
    if register == 'R0' or register == 'VR0':
        return '00000'
    if register == 'R1' or register == 'VR1':
        return '00001'
    if register == 'R2' or register == 'VR2':
        return '00010'
    if register == 'R3' or register == 'VR3':
        return '00011'
    if register == 'R4' or register == 'VR4':
        return '00100'
    if register == 'R5' or register == 'VR5':
        return '00101'
    if register == 'R6' or register == 'VR6':
        return '00110'
    if register == 'R7' or register == 'VR7':
        return '00111'
    if register == 'R8' or register == 'VR8':
        return '01000'
    if register == 'R9' or register == 'VR9':
        return '01001'
    if register == 'R10' or register == 'VR10':
        return '01010'
    if register == 'R11' or register == 'VR11':
        return '01011'
    if register == 'R12' or register == 'VR12':
        return '01100'
    if register == 'R13' or register == 'VR13':
        return '01101'
    if register == 'R14' or register == 'VR14':
        return '01110'
    if register == 'R15' or register == 'VR15':
        return '01111'
    if register == 'R16' or register == 'VR16':
        return '10000'
    if register == 'R17' or register == 'VR17':
        return '10001'
    if register == 'R18' or register == 'VR18':
        return '10010'
    if register == 'R19' or register == 'VR19':
        return '10011'
    if register == 'R20' or register == 'VR20':
        return '10100'
    if register == 'R21' or register == 'VR21':
        return '10101'
    if register == 'R22' or register == 'VR22':
        return '10110'
    if register == 'R23' or register == 'VR23':
        return '10111'
    if register == 'R24' or register == 'VR24':
        return '11000'
    if register == 'R25' or register == 'VR25':
        return '11001'
    if register == 'R26' or register == 'VR26':
        return '11010'
    if register == 'R27' or register == 'VR27':
        return '11011'
    if register == 'R28' or register == 'VR28':
        return '11100'
    if register == 'R29' or register == 'VR29':
        return '11101'
    if register == 'R30' or register == 'VR30':
        return '11110'
    if register == 'R31' or register == 'VR31':
        return '11111'

#Función que indica cuántos registros utiliza una instrucción
def getNumberOfRegisters(operation):
    if operation == 'ADD' or operation == 'SUB' or operation == 'AND' or operation == 'OR' or operation == 'XOR' or operation == 'ADDV' or operation == 'SUBV' or operation == 'ANDV' or operation == 'ORV' or operation == 'XORV':
        return 3
    elif operation == 'ADDI' or operation == 'SUBI'  or operation == 'MULI' or operation == 'DIV' or operation == 'MOV' or operation == 'LNUM' or operation == 'ANDI' or operation == 'ORI' or operation == 'NOT' or operation == 'LDR' or operation == 'STR' or operation == 'ADDIV' or operation == 'SUBIV'  or operation == 'MULIV' or operation == 'DIVV' or operation == 'MOVV' or operation == 'LNUMV' or operation == 'ANDIV' or operation == 'ORIV' or operation == 'NOTV' or operation == 'LDV' or operation == 'STV' or operation == 'JEQ' or operation == 'JNE' or operation == 'JGE' or operation == 'JGT' or operation == 'JLE' or operation == 'JLT' :
        return 2
    elif operation == 'MOVI' or operation == 'MOVIV':
        return 1
    else:
        return 0

#Función que indica si la operación tiene un valor inmediato
def haveInmediates(operation):
    if operation == 'ADDI' or operation == 'SUBI'  or operation == 'MULI'  or operation == 'DIV' or operation == 'MOVI' or operation == 'LNUM' or operation == 'ANDI' or operation == 'ORI' or operation == 'LDR' or operation == 'STR':
        return True
    elif operation == 'ADDIV' or operation == 'SUBIV'  or operation == 'MULIV'  or operation == 'DIVV' or operation == 'MOVIV' or operation == 'LNUMV' or operation == 'ANDIV' or operation == 'ORIV' or operation == 'LDV' or operation == 'STV':
        return True
    else:
        return False

#Función que retorna un registro en una instrucción de memoria
def getRegisterMem(data):
    return data[2:-1]

#Función que busca el número de línea de una branch
def getBranchLine(branch):
    for index, key in enumerate(instructionLines):
        if  instructionLines[key] == branch:
            return key

#Función que extrae el registro de un offset
def getOffsetRegister(data):
    register = ''
    flag = False
    for i in data:
        if i == '(':
            flag = True
        elif i == ')':
            break
        elif flag == True:
            register = register + i
    return register        

#Función que extrae el registro de un offset
def getOffsetValue(data):
    offset = ''
    flag = False
    for i in data:
        if i == '(':
            break
        else:
            offset = offset + i
    return int(offset)

#Función que verifica si una instrucción tiene una sintáxis correcta y genera el bitstream
def parseInstruction(instruction, line):
    bitstreamOk = True
    bitstream = ''
    opType = ''
    flagOperation = False
    flagInmediate = False
    flagData = False
    flagIsBranch = False
    flagJump = False
    flagMem = False
    jumpType = ''
    memType = ''
    registerCounter = 0
    for i in instruction:
        dataType = checkOperationType(i)
        print ("Data type: " + str(dataType))
        if (dataType != 5) and (flagOperation == False):
            opType = i
            print ("Operation detected: " + opType)
            if i == 'NOP':
                return '00000000000000000000000000000000'
            if dataType == 3:
                memType = opType
                flagOperation = True
                flagMem = True
                registerCounter = 2
                bitstream = parseOperation(i)
                print ("Parsed operation: " + bitstream)
            elif dataType == 4:
                jumpType = opType
                flagJump = True
                flagOperation = True
                registerCounter = 2
                bitstream = parseOperation(i)
                print ("Parsed operation: " + bitstream)
            else:
                flagOperation = True
                flagInmediate = haveInmediates(i)
                print ("Inmediate value expected: " + str(flagInmediate))
                registerCounter = getNumberOfRegisters(i)
                print ("Registers expected: " + str(registerCounter))
                bitstream = parseOperation(i)
                print ("Parsed operation: " + bitstream)
                if registerCounter == 3 or opType == 'MOV' or opType == 'MOVI' or opType == 'MOVV' or opType == 'MOVIV' or opType == 'NOT' or opType == 'NOTV':
                    flagData = True
        elif flagJump == True:
            if jumpType == 'JMP':
                line = getBranchLine(i)
                bitstream = bitstream +intToBinary(line, 25)
                print ("Parsed operation: " + bitstream)
                break
            else:
                if registerCounter != 0:
                    if (checkRegister(i) == True):
                        print ("Register " + i + ": Correct")
                        bitstream = bitstream + parseRegister(i)
                        registerCounter -= 1
                        print("Parsed register " + i + ": " + parseRegister(i))
                        print ("Expected registers left: " + str(registerCounter))
                    else:
                        print ("ERROR: valid register value expected")
                        bitstreamOk = False  
                else:
                    line = getBranchLine(i)
                    bitstream = bitstream + intToBinary(line, 15)
                    print ("Parsed operation: " + bitstream)
                    return bitstream
        elif flagMem == True:
            if registerCounter == 2:
                if checkRegister(i) == True:
                    print ("Register " + i + ": Correct")
                    bitstream = bitstream + parseRegister(i)
                    registerCounter -= 1
                    print("Parsed register " + i + ": " + parseRegister(i))
                    print ("Expected registers left: " + str(registerCounter))
                else:
                    print ("ERROR: valid register value expected")
                    bitstreamOk = False      
            else:
                if checkRegister(getOffsetRegister(i)) == True:
                    print ("Register " + i + ": Correct")
                    reg = getOffsetRegister(i)
                    offset = getOffsetValue(i)
                    print ("Register " + reg + ": Correct")
                    print ("Offset " + str(offset) + ": Correct")
                    bitstream = bitstream + parseRegister(reg) + intToBinary(offset, 15)
                else:
                    print ("ERROR: valid register value expected")
                    bitstreamOk = False   

        elif (dataType == 5) and (flagOperation == True):
            if registerCounter != 0:
                if (checkRegister(i) == True):
                    print ("Register " + i + ": Correct")
                    bitstream = bitstream +parseRegister(i)
                    registerCounter -= 1
                    print("Parsed register " + i + ": " + parseRegister(i))
                    print ("Expected registers left: " + str(registerCounter))                
                else:
                    print ("ERROR: valid register value expected")
                    bitstreamOk = False
            if (flagInmediate == True) and (checkInmediate(i) == True):
                if opType == 'MOVI' or opType == 'MOVIV':
                    inmediateValue = intToBinary(int(i), 15)
                    print ("Inmediate value: " + inmediateValue)
                    bitstream = bitstream + inmediateValue
                    flagInmediate = False
                    flagData = True
                else:
                    inmediateValue = intToBinary(int(i), 15)
                    print ("Inmediate value: " + inmediateValue)
                    bitstream = bitstream + inmediateValue
                    flagInmediate = False
        elif (dataType == 5) and (flagOperation == False):
            instructionLines[line] = i
            flagIsBranch = True
            break

        #Caso para añadir una branch       
        else:
            print ("ERROR: wrong instruction syntax")
            bitstreamOk = False

    if flagIsBranch == True:
        return False
    
    if flagData == True:
        if (opType == 'ADD') or (opType == 'SUB') or (opType == 'MUL') or (opType == 'AND') or (opType == 'OR') or (opType == 'XOR') or (opType == 'ADDV') or (opType == 'SUBV') or (opType == 'MULV') or (opType == 'ANDV') or (opType == 'ORV') or (opType == 'XORV'):
            return bitstream + '0000000000'
        elif (opType == 'MOV') or (opType == 'MOVV'):
            return bitstream + '000000000000000'
        elif (opType == 'MOVI') or (opType == 'MOVIV'):
            return bitstream + '00000'
        else:
            return bitstream + '000000000000000'

    return bitstream

#Función que genera el archivo bin de salida con las instrucciones parseadas
def createBinary():
    line = 0
    parsedBinaryData = ''
    file = open("../Program/parsedInst.txt", "a+")
    print("Creating binary file")
    for i in instructionsList:
        parsedBinaryData = parseInstruction(instructionToList(i), line)
        if (parsedBinaryData != False) and (i != ''):
            file.write(parsedBinaryData + "\n")
            line += 1
            print("Parsed instruction: " + parsedBinaryData)
        else:
            line += 1
    file.close()
    print("....................................")

#print (parseInstruction(['STV', 'VR2', '100(VR2)'],0))
readFile()
deleteEndOfLine()
createBinary()
