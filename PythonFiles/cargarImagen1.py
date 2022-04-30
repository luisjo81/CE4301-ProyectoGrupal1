import cv2

imagen = cv2.imread('./vengadores.png', 0)

cv2.imwrite('Grises.png',imagen)
cv2.imshow('Loj Advenyer',imagen)
cv2.waitKey(10000)
cv2.destroyAllWindows()
