graus=theta1.values
graus2=theta2.values
graust=graus2-graus
figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Deslocamento Angular[θ]','Fontsize',4)
title("Grafico Deslocamento X tempo - XCOS")

plot(theta1.time,graust,'b','LineWidth',2);
xgrid(1)
