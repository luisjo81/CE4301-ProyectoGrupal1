import numpy as np
import cv2

image = cv2.imread('../imgs/test1.png')
data = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

R = []
G = []
B = []

print(data.shape)
print(data.size)
print(data.dtype)
print(data)

def OrdenarImagen(data):
    data_count = 0
    n = data.size
    while data_count < n:
        R.append(data.item(data_count))
        G.append(data.item(data_count + 1))
        B.append(data.item(data_count + 2))
        data_count += 3

def ComposicionAlfa(transparencia, degradadoRojo, degradadoVerde, degradadoAzul):
    degradadoRojo = 255 * degradadoRojo
    degradadoVerde = 255 * degradadoVerde
    degradadoAzul = 255 * degradadoAzul
    reduccionRojo = degradadoRojo / (data.size / 18)
    reduccionAzul = degradadoAzul / (data.size / 18)
    reduccionVerde = degradadoVerde / (data.size / 18)
    n = 1
    for i in range(len(R)):
        R[i] = int(R[i] * (1 - transparencia) + degradadoRojo * transparencia)
        if i == 8 * n:
            degradadoRojo -= reduccionRojo
            n += 1
    n = 1
    for i in range(len(G)):
        G[i] = int(G[i] * (1 - transparencia) + degradadoVerde * transparencia)
        if i == 8 * n:
            degradadoVerde -= reduccionVerde
            n += 1
    n = 1
    for i in range(len(B)):
        B[i] = int(B[i] * (1 - transparencia) + degradadoRojo * transparencia)
        if i == 8 * n:
            degradadoAzul -= reduccionAzul
            n += 1

OrdenarImagen(data)
ComposicionAlfa(1/2, 1/4, 3/4, 1/2)
print(R)
print(B)
print(G)
        
    
    
    
    
