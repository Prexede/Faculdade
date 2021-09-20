graus=theta.values*(180/%pi)

figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Deslocamento Angular[θ]','Fontsize',4)
title("Grafico Deslocamento X tempo - XCOS")

plot(theta.time,graus,'b','Fontsize',4);
xgrid(1)
