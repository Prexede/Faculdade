import math
x1 = int(input("X1: "))
y1 = int(input("Y1: "))
x2 = int(input("X2: "))
y2 = int(input("Y2: "))

d = math.sqrt(pow((x1 - x2),2) + pow((y1 - y2),2))
if(d >= 10):
    print("longe")
else:
    print("perto")
