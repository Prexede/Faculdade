
figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
title('Gráfico da Curva de Tensão do Capacitor pelo (Paleta Eletrica)', 'Fontsize', 2);
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
plot(TensaoB.time,TensaoB.values,'r-', 'LineWidth',2);


figure(2)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
title('Grafico Corrente no capacitor X tempo (Paleta Eletrica)', 'Fontsize', 2);
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Corrente[A]','Fontsize',4)
plot(CorrenteB.time,CorrenteB.values,'b-', 'LineWidth',2);
