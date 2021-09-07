//b) Gere os seguintes gr´aficos:
//i. Energia cin´etica × deslocamento e Energia potencial × deslocamento (mesma janela).
figure(1)
f =get("current_figure");
f.background = -2;
plot(Deslocamento.values,Cinetica.values,'b-','LineWidth',2)
xlabel('Deslocamento[m]', 'Fontsize',4)
ylabel('Energia[J]','Fontsize',4)
plot(Deslocamento.values,Potencial.values,'g:','LineWidth',2)
legend('Energia Cinetica','Energia Potencial')


//ii. Energia cin´etica × velocidade e Energia potencial × velocidade (mesma janela).
figure(2)
f =get("current_figure");
f.background = -2;
plot(Velocidade.values,Cinetica.values,'r-','LineWidth',2)
xlabel('Velocidade[m/s]', 'Fontsize',4)
ylabel('Energia[J]','Fontsize',4)
plot(Velocidade.values,Potencial.values,'b:','LineWidth',2)
legend('Energia Cinetica','Energia Potencial')


//iii. Velocidade × deslocamento.
figure(3)
f =get("current_figure");
f.background = -2;
plot(Velocidade.values,Deslocamento.values,'m-.','LineWidth',2)
xlabel('Velocidade[m/s]', 'Fontsize',4)
ylabel('Deslocamento[m]','Fontsize',4)
legend('Velocidade x Deslocamento')
