

E = 5;
R = 1000;
C = 1*10^-3;
t = linspace(0,10);

V = E*(1 - (%e^(-t/(R*C))));
I = ((E/R)*(%e^(-t/(R*C))));

figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Grafico Tensão no capacitor X tempo")

plot(t,V,'b--', 'LineWidth',2);
xgrid(1)

figure(2)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Corrente[A]','Fontsize',4)
title("Grafico Corrente no capacitor X tempo")

plot(t,I,'r--','LineWidth',2);
xgrid(1)
