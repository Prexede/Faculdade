figure(0)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Velocidade Angular[rad/s]','Fontsize',4)
title("Comparação das tensões de tacometro primeira e segunda ordem");
plot(t,wt,'b','LineWidth',2);
plot(t,wt1,'r--','LineWidth',3);
L = legend('Primeira ordem','Segunda ordem');
xgrid(1)
