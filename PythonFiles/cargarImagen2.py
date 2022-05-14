from json import load
from PIL import Image
import numpy as np
import cv2

imagen = cv2.imread('./test.png', 0)
cv2.imwrite('Grises.png',imagen)

image = Image.open("./Grises.png")

print(image.format)
print(image.size)
print(image.mode)

# image.show()

data = np.asmatrix(image)

print(type(data))
print(data.shape)

# create Pillow image
# image2 = Image.fromarray(data)
# print(type(image2))


print(data)
np.savetxt(fname="imagenBinarizada.txt", X= data, delimiter=",", newline="\n", fmt="%.3d")

# data.tofile(fid="./imagenBinarizada.txt")

# np.save("imagenBinarizada2.txt", data)

intToBinary = lambda x, n: format(x, 'b').zfill(n)

def imgToMemory(data):
    n = len(data)
    filewrite = open("..\Ram_data.mif", "w")
    filewrite.write("WIDTH=8;\n")
    filewrite.write("DEPTH=65536;\n")
    filewrite.write("ADDRESS_RADIX=UNS;\n")
    filewrite.write("DATA_RADIX=UNS;\n")
    filewrite.write("CONTENT BEGIN\n")
    mem_count = 0
    for i in range(n * n):
        byteData = intToBinary(data.item(i), 8)
        filewrite.write("    "+str(mem_count)+"    :    "+str(byteData)+";\n")
        mem_count+=1
    filewrite.write("    ["+str(mem_count)+"..65535]    :    0;\n")
    filewrite.write("END;\n")

imgToMemory(data)

