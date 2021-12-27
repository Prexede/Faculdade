import math
a = int(input("a: "))
b = int(input("b: "))
c = int(input("c: "))

delta = (pow(b,2) - 4 * a * c)
if(delta < 0):
  print("esta equação não possui raízes reais")
else:
    if(delta == 0):
        x = ( (-1*b)/ (2*a) )
        print("a raiz desta equação é",x)
    else:
        x1 = ((-1*b) + math.sqrt(delta)) / 2*a
        x2 = ((-1*b) - math.sqrt(delta)) / 2*a
        if(x1 > x2):
          print("as raízes da equação são",x2,"e",x1)
        else:
          print("as raízes da equação são",x1,"e",x2)


  


