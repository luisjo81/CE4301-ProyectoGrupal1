from json import load
from PIL import Image
import numpy as np
import cv2

imagen = cv2.imread('./vengadores.png', 0)
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