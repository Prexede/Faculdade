val = int(input("Valor:"))

vet = [1,2,3,4,5]; n = 1; b = 5; p = 25; o = 100; r = 200

vet[0] =  val // r
val = val % r
vet[1] = val // o
val = val % o
vet[2] = val // p
val = val % p
vet[3] = val // b
val = val % b
vet[4] = val // n
val = val % n

        
print("Voce tem",vet[0],"plat",", ",vet[1],"ouros ",vet[2],"pratas ",vet[3],"bronzes ", vet[4],"niqueis")
       
