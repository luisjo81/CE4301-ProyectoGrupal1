def insToMemory(filename, filename2):
    data = deleteEndOfLine(filename.readlines())
    n = len(data)
    print(data)
    filename2.write("WIDTH=32;\n")
    filename2.write("DEPTH=256;\n")
    filename2.write("ADDRESS_RADIX=UNS;\n")
    filename2.write("DATA_RADIX=UNS;\n")
    filename2.write("CONTENT BEGIN\n")
    mem_count = 0
    for i in range(n):
        filename2.write("    " + str(mem_count) + "    :    " + str(data[i]) + ";\n")
        mem_count += 1
    filename2.write("    [" + str(mem_count) + "..255]    :    0;\n")
    filename2.write("END;\n")

def deleteEndOfLine(instructionsList):
    tempList = []
    for i in instructionsList:
        tempList += [i[0:-1]]
    instructionsList = tempList
    return instructionsList

filename = open(".\parsedInst.txt", "r")
filename2 = open("..\Rom_data.mif", "w")
insToMemory(filename, filename2)
filename.close()
filename2.close()
