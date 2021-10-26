

figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Velocidade angular[w/s]','Fontsize',4)
title("Comparaçao malha fechada dos ganhos no controlador PI(XCOS)");
plot(kpi_10.time,kpi_10.values,'g','LineWidth',2);
plot(kpi_100.time,kpi_100.values,'r','LineWidth',2);
L = legend('Ganho 10', 'Ganho 100');
