val = int(input("Digite o numero de segundos para converção: "))
DiasI = (val//(60*60*24))
HorasF = 24 *((val / 86400)% 1)
HorasI = int(HorasF)
MinF = 60 * (HorasF % 1)
MinI = int(MinF)
SegF = 60 * (MinF % 1)
SegI = int(SegF)

print(DiasI,"dias,",HorasI,"horas,",MinI,"minutos e",SegI,"segundos.")

