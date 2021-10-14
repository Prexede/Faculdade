// Definição de variaveis 
R1 = 90;
R2 = 1.45;
C1 = 0.01022;
C2 = C1;
t = linspace(0,10,100); //Tempo 

//Definição da FT
//a)
s=poly(0,"s");
den = ((R1*R2*C1*C2)*(s^2)) + (s*(R1*C1)+(R2*C2)+(R2*C1)) + 1;
num = R2;
S = syslin('c',num,den);

//b)
[z,p,k]=tf2zp(S);   //Encontrando Zeros e Polos


//c)
Ks = 0.4;   //Sensor
Kb = 8.061; //Bomba
Kp = S;     //Planta;
FT = Kp*Kb*Ks; 

//2a)
Deg = csim('step',t,FT); //Aplicar entrada Degrau

//b)
Imp = csim('impuls',t,FT);

//c)
den1 = s*(((R1*R2*C1*C2)*(s^2)) + (s*(R1*C1)+(R2*C2)+(R2*C1)) + 1);
num = R2;
S1 = syslin('c',num,den1);
Kp1 = S1;
FT1 = Kp1*Kb*Ks; 
Ramp = csim('step',t,FT1);

//d)
t1 = 0:10:8000;
pi = 3.14159
P = 2000;
deff('u=timefun(t1)','u=(sin(2*pi*t1/P))');
arb = csim(timefun, t1, FT);
clf()


figure(0)

//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Grafico da resposta do sistema em malha aberta[Entrada Degrau] X tempo");
xgrid(1)
plot(t,Deg,'g','LineWidth',2);

figure(1)

//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Grafico da resposta do sistema em malha aberta[Entrada Impulso] X tempo");
xgrid(1)
plot(t,Imp,'b','LineWidth',2);

figure(2)

//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Grafico da resposta do sistema em malha aberta[Entrada Rampa] X tempo");
xgrid(1)
plot(t,Ramp,"r",'LineWidth',2);

figure(3)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Grafico da resposta do sistema em malha aberta[Entrada Rampa] X tempo");
xgrid(1)
plot(t1,arb,"r",'LineWidth',2);
plot(t1,timefun(t1),"b",'LineWidth',2);
L = legend('Entrada','Saida');
