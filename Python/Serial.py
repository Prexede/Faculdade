
from time import sleep
import serial 
import time

ser = serial.Serial()
ser.baudrate = 115200
ser.port = 'COM4'
ser.open()
Rd = bytearray([111,0,1,0,1,37,0,0,1,0,1,0,0,0,1,0,1,0,0])
while (1):
    
    ser.write(Rd)
    
    
    
    

contador = 0

ser.close()
