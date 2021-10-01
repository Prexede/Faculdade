
figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Deslocamento Angular[θ]','Fontsize',4)
title("Grafico Deslocamento X tempo(ZCOS)")

xgrid(1)
θg1=θ1.values*(180/%pi)

plot(θ1.time,θg1,'r');
plot(θ.time,θg,'b-');
