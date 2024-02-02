close all
clear
% Função triangular
[xM,yM] = vetTriang(1,160,50,80,110,500);
x = xM;
% Função Trapezoidal Baixa
[xB,yB] = vetTrapez(1,160,1,1,50,80,500);
% Função Trapezoidal Alta
[xA,yA] = vetTrapez(1,160,80,110,160,160,500);

figure
plot(xM,yM,xB,yB,xA,yA)
xlabel("Velocidade [m/s]");
ylabel("µ(x)");
legend('Trapezoidal [Baixa]','Triangular [Médio]','Trapezoidal[alta]')
grid on

%União Baixo Medio
U = max(yB,yM);

%Intersecção Medio/Alto
I = min(yM,yA);

%Não Media
N = vetComp(yM);

%Graficos
figure
plot(x,U);
title("Baixo ∪ Medio")
xlabel("Velocidade [m/s]");
ylabel("µ(x)");
grid on
xlim([1,160]);


figure
plot(x,I);
title("Medio ∩ Alto")
xlabel("Velocidade [m/s]");
ylabel("µ(x)");
grid on
ylim([0,1]);
xlim([1,160]);


figure
plot(x,N);
title("Não(Medio)")
xlabel("Velocidade [m/s]");
ylabel("µ(x)");
grid on
xlim([1,160]);