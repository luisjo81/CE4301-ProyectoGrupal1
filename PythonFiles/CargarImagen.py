import numpy as np
import cv2

image = cv2.imread('../imgs/test1.png')
data = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
##print(data)

##data_reshaped = data.reshape(data.shape[0], -1)
##np.savetxt(fname="ImagenBinarizada.txt", X=data_reshaped, delimiter=",", newline="\n", fmt="%.3d")

intToBinary = lambda x, n: format(x, 'b').zfill(n)

def imgToMemory(data):
    n = data.size
    filewrite = open("../Ram_data.mif", "w")
    filewrite.write("WIDTH=48;\n")
    filewrite.write("DEPTH=8192;\n")
    filewrite.write("ADDRESS_RADIX=UNS;\n")
    filewrite.write("DATA_RADIX=BIN;\n")
    filewrite.write("CONTENT BEGIN\n")
    mem_count = 0
    data_count = 0
    vec_count = 0
    byteData = ''
    while data_count < n:
        byteReds = intToBinary(data.item(data_count), 8)
        byteData += str(byteReds)
        if vec_count == 5:
            filewrite.write("    " + str(mem_count) + "    :    " + byteData + ";\n")
            mem_count += 1
            vec_count = 0
            byteData = ''
        else:
            vec_count += 1
        data_count += 3
    vec_count = 0
    data_count = 1
    byteData = ''
    while data_count < n:
        byteGreens = intToBinary(data.item(data_count), 8)
        byteData += str(byteGreens)
        if vec_count == 5:
            filewrite.write("    " + str(mem_count) + "    :    " + byteData + ";\n")
            mem_count += 1
            vec_count = 0
            byteData = ''
        else:
            vec_count += 1
        data_count += 3
    vec_count = 0
    data_count = 2
    byteData = ''
    while data_count < n:
        byteBlues = intToBinary(data.item(data_count), 8)
        byteData += str(byteBlues)
        if vec_count == 5:
            filewrite.write("    " + str(mem_count) + "    :    " + byteData + ";\n")
            mem_count += 1
            vec_count = 0
            byteData = ''
        else:
            vec_count += 1
        data_count += 3
    filewrite.write("    [" + str(mem_count) + "..8191]    :    000000000000000000000000000000000000000000000000;\n")
    filewrite.write("END;\n")


imgToMemory(data)
