


figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Velocidade angular[w/s]','Fontsize',4)
title("Gráfico Velocidade angular x tempo(XCOS)");
plot(kh_1.time,kh_1.values,'b','LineWidth',2);

L = legend('velocidade angular saída');


figure(2)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Gráfico do controle HYSTHERESIS x tempo(XCOS)");
plot(outkh_1.time,outkh_1.values,'g','LineWidth',2);
L = legend('sinal do controlador');

