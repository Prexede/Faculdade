;  Desenvolvida por: Carlos Eduardo Souza Silva.
;   Data: 13/02/2022

        n1 equ R0 
        n2 equ R1
        n3 equ R2
        n4 equ R3
        res1 equ R10
        res2 equ R11 
 
main:   mov n1, 0x18   ; dec 6339 = hex 18C3 
        mov n2, 0xC3     
        mov n3, 0x3B   ; dec 15.238 = hex 3B86
        mov n4, 0x86
        add res1, n1, n3
        add res2, n2, n4

halt:   jmp halt
        