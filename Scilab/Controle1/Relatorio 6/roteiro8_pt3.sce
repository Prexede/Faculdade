
figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Velocidade angular[w/s]','Fontsize',4)
title("Comparaçao malha fechada dos ganhos no controlador PD(XCOS)");
plot(kpd_1.time,kpd_1.values,'b','LineWidth',2);
plot(kpd_5.time,kpd_5.values,'g','LineWidth',2);
plot(kpd_5_200.time,kpd_5_200.values,'r','LineWidth',2);
L = legend('Ganho 1 zero 20','Ganho 5 zero 20', 'Ganho 5 zero 200');
