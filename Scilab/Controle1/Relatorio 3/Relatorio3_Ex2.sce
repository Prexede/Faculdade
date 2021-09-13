figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Grafico Tensão no capacitor X tempo(XCOS)")

xgrid(1)

plot(Tensão.time,Tensão.values,'LineWidth',2)

figure(2)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Corrente[A]','Fontsize',4)
title("Grafico Corrente no capacitor X tempo(XCOS)")

plot(Corrente.time,Corrente.values,'r','LineWidth',2);
xgrid(1)
