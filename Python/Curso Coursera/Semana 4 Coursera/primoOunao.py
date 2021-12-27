n = int(input("Digite um número inteiro: "))
i = n
som = 0
while i > 0:
    if(n % i == 0):
       som = som + 1 
    i -= 1
if(som > 2):
    print("não primo")
else:
    print("primo")
    

    
