// Definiçao de Variaveis 

Ra = 3.5785;         //Resistencia da Armadura;
La = 0.003002923;   //Indutancia da armadura;
Kt = 0.0845;       //Constatante de força
Ke = Kt;          //Constante de torque 
B = 0.000106;    //Atrito Viscoso 
Fd = 0.0062;    //Atrito dinamico
J = 0.00015;   //Momento de Inercia

Ta = La / Ra;
Tb = J / B;
Tm = (Ra*J)/(Ke*Kt);

//Funçao Transferencia 
s = poly(0,"s");
den1 = (s^2)+(((1/Ta)+(1/Tb))*s) + ((1/(Tm*Ta))+(1/(Ta*Tb))); 
num1 = 1 / (Ke*Tm*Ta);
T1 = syslin('c',num1,den1);
t = linspace(0,1.3,130);
deff('u=timefun(t)','u=10') //Entrada Degrau 10V
w1 = csim(timefun,t,T1);   //Velocidade angular 


figure(0)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Velocidade Angular[rad/s]','Fontsize',4)
title("Velocidade angular a uma entrada degrau(Modelo de Segunda ordem )");
plot(t,w1,'r','LineWidth',2);
xgrid(1)

wt1 = w1/11.466;              //Vtaco

figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Velocidade Angular[rad/s]','Fontsize',4)
title("Vtaco a uma entrada degrau(Modelo de Segunda ordem )");
plot(t,wt1,'b','LineWidth',2);
xgrid(1)
