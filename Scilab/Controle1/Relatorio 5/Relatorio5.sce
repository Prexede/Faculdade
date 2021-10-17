Tensao = A.values;
t =A.time;


//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Tensão[V]','Fontsize',4)
title("Grafico da resposta do sistema eletrico");
plot(t,Tensao);
