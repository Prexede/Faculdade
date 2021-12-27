n = input("digite um numero inteiro:")
pot = len(n)
numadj = False
aux1=0
aux2=0

while not numadj:
  aux1 = int(n) // (10**(pot-1))
  n = int(n) % (10**(pot-1))
  pot=pot-1
  aux2 = n // (10**(pot-1))
  if aux1 == aux2 and pot > 0:
    numadj=True  
    print("sim")
  elif pot==0:
    numadj=True
    print("não")
            
            
    

        
