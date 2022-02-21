;  Desenvolvida por: Carlos Eduardo Souza Silva.
;   Data: 20/02/2022 
        
 
main:   mov R1, 0xFF   ; dec 15.238 = hex 3B86
        mov R0, 0xFF
        mov R2, 0x0B   ; dec 6339 = hex 18C3 
        ;mov n4, 0x18     
        clr R3
        clr R4
        clr R5
        clr R6
    
Soma:        
        lsr R2
        brcc deslocamento
        add R4, R4,R0
        adc R5, R5,R1
        adc R6, R6,R3

deslocamento:
        lsl R0
        ror R1
        ror R3
        tst R2
        brne Soma
