loadmatfile('dados_motor.mat');
figure(0)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo[s]', 'Fontsize',4)
ylabel('Velocidade Angular[rad/s]','Fontsize',4)
title("Comparação das velocidades angulares (real / teorico 1 ordem)");

sinal = wt(128);
vtau = 0.632*sinal;
indice= find( wt > vtau,1)
tau=t(indice);

plot(t,w,'b','LineWidth',2);
plot(dados_motor(3:262,1),dados_motor(3:262,2),'r','LineWidth',1);
L = legend('Teorico','Real',);
xgrid(1)



