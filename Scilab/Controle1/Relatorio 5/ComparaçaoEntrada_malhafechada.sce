Tensao = malhafechada.values;
t = malhafechada.time;
Entrada = entrada.values;
figure(0)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Comparaçao da entrada degrau e saida sistema de malha fechada");
plot(t,Tensao,'b','LineWidth',3);
plot(t,Entrada,'r','LineWidth',3);
L = legend('Saida','Entrada');

Tensao1 = malhaaberta.values;

figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Comparaçao malha fechada e saida malha aberta");
plot(t,Tensao1,'b','LineWidth',3);
plot(t,Tensao,'r','LineWidth',3);
L = legend('Saida','Entrada');
