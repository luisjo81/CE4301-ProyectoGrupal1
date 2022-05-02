import numpy as np


def algoritmo():
    l = np.array([[10, 20],[30,40]])
    m = 6
    n = m-1
    a = np.zeros((m,m), int)
    a[0,0] = 10
    a[0,n] = 20
    a[n,0] = 30
    a[n,n] = 40


    #generando vertical izquierda
    for i in range(1,n):
        index = i+1
        a[i,0] = round(((((m-index)/(m-1))*a[0,0])+(((index-1)/(m-1))*a[n,0])))
        print(">>>>>>>>>>>>>>>>>>>>>>>")
        print(a)
    #generando vertical derecha
    for i in range(1,n):
        index = (i+1)*m
        a[i,n] = round(((((m*m-index)/(m*m-m))*a[0,n])+(((index-m)/(m*m-m))*a[n,n])))
        print(">>>>>>>>>>>>>>>>>>>>>>>")
        print(a)

    # #generando horizontal superior
    for x in range(m):
        for y in range(1,n):
            index = y+1
            a[x,y] = round(((((m-index)/(m-1))*a[x,0])+(((index-1)/(m-1))*a[x,n])))
            print(">>>>>>>>>>>>>>>>>>>>>>>")
            print(a)

    print("####################")
    print(a)
algoritmo()