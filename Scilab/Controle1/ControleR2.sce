//b) Gere os seguintes gr´aficos:
//i. Energia cin´etica × deslocamento e Energia potencial × deslocamento (mesma janela).

plot(Deslocamento.values,Cinetica.values,'b-','LineWidth',2)
xlabel('Deslocamento[m]', 'Fontsize',4)
ylabel('Energia[J]','Fontsize',4)
plot(Deslocamento.values,Potencial.values,'g:','LineWidth',2)
legend('Cinetica','Potencial')

//ii. Energia cin´etica × velocidade e Energia potencial × velocidade (mesma janela).
plot(Cinetica.values,Velocidade.values,'b-','LineWidth',2)
