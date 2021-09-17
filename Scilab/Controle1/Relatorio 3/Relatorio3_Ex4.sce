
figure(1)
f =get("current_figure");
f.background = -2;
title('Grafico Tensão no capacitor X tempo', 'Fontsize', 2);
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
plot(t,V,'b--', 'LineWidth',4);
plot(Tensão.time,Tensão.values,'r--', 'LineWidth',3);
plot(TensaoB.time,TensaoB.values,'g--', 'LineWidth',3);
legend('Tensão 1','Tensão 2','Tensão 3')
xgrid(1)

figure(2)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
title('Grafico Correntes no capacitor X tempo', 'Fontsize', 2);
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Corrente[A]','Fontsize',4)
plot(t,I,'b--', 'LineWidth',4);
plot(Corrente.time,Corrente.values,'r--', 'LineWidth',3);
plot(CorrenteB.time,CorrenteB.values,'g--', 'LineWidth',3);
l=legend('Corrente 1','Corrente 2','Corrente 3')
xgrid(1)
