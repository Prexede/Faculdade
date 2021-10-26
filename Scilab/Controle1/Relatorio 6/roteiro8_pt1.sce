
figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Velocidade angular[w/s]','Fontsize',4)
title("Comparaçao malha fechada dos ganhos P(XCOS)");
plot(kp_1.time,kp_1.values,'b','LineWidth',2);
plot(kp_10.time,kp_10.values,'g','LineWidth',2);
plot(kp_100.time,kp_100.values,'r','LineWidth',2);
L = legend('Ganho 1','Ganho 10', 'Ganho 100');
