
;  Desenvolvida por: Carlos Eduardo Souza Silva.
;   Data: 13/02/2022

        n1 equ R0 
        n2 equ R1
        n3 equ R2   ;primeiro numero
        n4 equ R3

        n5 equ R4
        n6 equ R5
        n7 equ R6   ;segundo numero 
        n8 equ R7 


        res1 equ R10
        res2 equ R11 
        res3 equ R12    ;resposta
        res4 equ R13


main:   mov n1, 0x15   ; dec 359.467.186 = hex 156D 08B2 
        mov n2, 0x6D     
        mov n3, 0x08   
        mov n4, 0xB2

        mov n5, 0x9E
        mov n6, 0x3E
        mov n7, 0x8A       ; dec 2.654.898.754 = hex 9E3E 8A42                
        mov n8, 0x42


        add res1, n4, n8
        add res2, n3, n7
        add res3, n2, n6
        add res4, n1, n5

halt:   jmp halt
        