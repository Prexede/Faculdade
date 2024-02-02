import serial
import time
import pandas as pd

#Inicialização da biblioteca e definição do baudrate do serial
ser = serial.Serial()
ser.baudrate = 115200

ser.port = 'COM8' #'/dev/ttyACM0' # Conferir a porta USB que será utilizada



dirMot1_Robo3 = 0b10000000
dirMot2_Robo3 = 0b00100000
#Robo 2
dirMot1_Robo1 = 0b10000000
dirMot2_Robo1 = 0b00100000
#Robo 1
dirMot1_Robo2 = 0b00001000
dirMot2_Robo2 = 0b00000010
#velocidades robo 1
v1 = 30
v2 = v1

v3 = v1
v4 = v1

v5 = v1
v6 = v1

#configuração direção das rodas
direcao1 = dirMot1_Robo1 + dirMot2_Robo1 + dirMot1_Robo2 + dirMot2_Robo2
direcao2 = dirMot1_Robo3 + dirMot2_Robo3

#montagem da mensagem
Rd = bytearray([111, direcao1, direcao2, v1, v2, v3, v4, v5, v6, 113])


while(True):
    print("digite o proximo comando desejado \n1 - Testar o controle \n2 - Alterar constantes de controle \n3 - Pausar")
    opc  = int(input())
    if opc == 1:
        ser.open()
        t = 0
        start = time.time()
        tref = 1
        somador = 10
        while t<=5:
            if t>1 and t<2:
                v3=30
                v4=30
            elif t>2 and t<3:
                v3 = 5
                v4 = 5
            elif t>3 and t<4:
                v3=30
                v4=30
            elif t>4:
                v3=5
                v4 = 5   
            Rd = bytearray([111, direcao1, direcao2, v1, v2, v3, v4, v5, v6, 113])
            ser.write(Rd)
            end = time.time()
            t = end - start
        while t<=7 and t>5:
            Rd = bytearray([111, 0, 0, 0, 0, 0, 0, 0, 0, 113])
            ser.write(Rd)
            end = time.time()
            t = end -start
        ser.close()
    elif opc == 2:
        print("antes de prosseguir digite as novas constantes no arquivo txt \nDigite 1 para prosseguir apos digitar")
        opc2 = int(input())
        ser.open()
        if opc2 == 1:
            t = 0
            a=[0,0,0,0,0,0,0,0]
            with open('controle.txt') as f:
                contador = 0
                for linhas in f:
                    if contador != 7:
                        a[contador] = int(linhas)
                        contador +=1 
            t = 0
            start = time.time()
            while t<= 1:
                Rd = bytearray([112, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], 113])
                ser.write(Rd)
                end = time.time()
                t =end - start
            Rd = bytearray([111, 0, 0, v1, v2, v3, v4, v5, v6, 113])
            ser.write(Rd)
        ser.close()
    elif opc ==3:
        break   
    
    elif opc == 4:
        ser.open()
        t = 0
        start = time.time()
        while t<=2:
            Rd = bytearray([111, direcao1, direcao2, v1, v2, v3, v4, v5, v6, 113])
            ser.write(Rd)
            end = time.time()
            t = end - start
        while t<=3 and t>2:
            Rd = bytearray([111, 0, 0, 0, 0, 0, 0, 0, 0, 113])
            ser.write(Rd)
            end = time.time()
            t = end -start
            PUlsoTotalA = ser.read()
        ser.close()
        



            