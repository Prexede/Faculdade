n =(input("Digite um número inteiro: "))
t = len(n)
n = int(n)
a = t
num = 0
while a > 0:
        num = (n // 10**(a-1)) + num
        n = (n % 10**(a-1)) 
        a = a - 1
print(num)        
        
