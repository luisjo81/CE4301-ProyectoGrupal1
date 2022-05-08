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

def imgToMemory(data):
    n = len(data)
    file = open("..\Rom_data.mif", "w")
    file.write("WIDTH=32;\n")
    file.write("DEPTH=2048;\n")
    file.write("ADDRESS_RADIX=UNS;\n")
    file.write("DATA_RADIX=UNS;\n")
    file.write("CONTENT BEGIN\n")
    mem_count = 0
    for i in range(n):
        print(i)
        for j in range(n):
            print(j)
            print([i][j])
            print(data[i][j])
            file.write("    "+str(mem_count)+"    :    "+str(data[i][j])+";\n")
            mem_count+=1
        j = 0
    file.write("    ["+str(mem_count)+"..8191]    :    0;\n")
    file.write("END;\n")

imgToMemory(data)
