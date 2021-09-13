E=5;
R=1000;
C=1*10^-3;
t=linspace(0,10);
Vc=E*(1-%e^(-t/(R*C)));
Ic=(E/R)*(%e^(-t/(R*C)));


figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
title('Gráfico da Curva de Tensão do Capacitor', 'Fontsize', 2);
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
plot(t,Vc,'r-', 'LineWidth',2);

figure(2)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
title('Gráfico da Curva da Corrente do Capacitor', 'Fontsize', 2);
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Corrente[A]','Fontsize',4)
plot(t,Ic,'b-', 'LineWidth',2);
