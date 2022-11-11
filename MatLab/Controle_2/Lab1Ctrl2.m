function Lab1Ctrl2

%   Sintaxe:
%
%   Observações:
%    
%   Exemplo:
%
%   Dependências:
%
%   Desenvolvida por: Carlos Eduardo  769877
%                     Allan Corço     769870
%                     Lucas Campos    769894
%   Data: 11/11/2022
%   Última modificação: 


%% Definição de Variaveis

% Constantes planta 
K = 0.4725;
T = 100;
L = 10;
A = 45;
Ta = 33.6;

% Tempo de funcionamento
t=linspace(0,600,6000);

%Função Transferencia 
G  = tf(K,[T 1]);

%Padme 1 grau
P1 = tf([-L 2],[L 2]);

%Pade 2 grau
P2 = tf([L^2 -6*L 12],[L^2 6*L 12]);

%Terceira aproximação
s = tf('s');
P3 = (K*exp(-L*s))/(T*s+1);

%% Multiplicação FT

GMa1 = series(G,P1);

GMa2 = series(G,P2);

%% Plot Degrau 

y1 = step(A*GMa1,t);
y2 = step(A*GMa2,t);
y3 = step(A*P3,t);

figure(1)
plot(t,(y1 + Ta))
title('Função Temperatura Malha aberta(primeira ordem)')
xlabel('Tempo[s]')
ylabel('Temperatura[ºC]')
grid on

figure(2)
plot(t,(y2 + Ta))
title('Função Temperatura Malha aberta(segunda ordem)')
xlabel('Tempo[s]')
ylabel('Temperatura[ºC]')
grid on

figure(3)  %%ERRO EEEEEEEEERROOOOOOOOOOOOOOOOOOOOOOOOOo
plot(t,(y3 + Ta))
title('Função Temperatura Malha aberta(terceira aproximação)')
xlabel('Tempo[s]')
ylabel('Temperatura[ºC]')
grid on

figure(4)
plot(t,(y1 + Ta),'r--',t,(y2 + Ta),'b-.',t,(y3 + Ta),'m:','LineWidth',1.2)
title('Respostas a Degrau funçoes de transferencia')
xlabel('Tempo[s]')
ylabel('Temperatura[ºC]')
legend('Resposta 1','Resposta 2','Resposta 3')
grid on


%% RESPOSTA 5.1.8



%% Malha fechada
Kp = T / (K*L);
tt = (0:0.1:250);
Ts=A-Ta;

GMf1 = feedback(Kp*GMa1,1);
GMf2 = feedback(Kp*GMa2,1);
GMf3 = feedback(Kp*P3,1);

yf1 = step(Ts*GMf1,tt);
yf2 = step(Ts*GMf2,tt);
yf3 = step(Ts*GMf3,tt);




figure(5)
plot(tt,(yf1 + Ta))
title('Função Temperatura Malha aberta(primeira ordem)')
xlabel('Tempo[s]')
ylabel('Temperatura[ºC]')
grid on

figure(6)
plot(tt,(yf2 +Ta))
title('Função Temperatura Malha aberta(segunda ordem)')
xlabel('Tempo[s]')
ylabel('Temperatura[ºC]')
grid on

figure(7)  %%ERRO EEEEEEEEERROOOOOOOOOOOOOOOOOOOOOOOOOo
plot(tt,(yf3 + Ta))
title('Função Temperatura Malha aberta(terceira aproximação)')
xlabel('Tempo[s]')
ylabel('Temperatura[ºC]')
grid on


figure(8)
plot(tt,(yf1 + Ta),'r--',tt,(yf2 + Ta),'b-.',tt,(yf3 + Ta),'m:','LineWidth',1.2)
title('Respostas a Degrau funçoes de transferencia')
xlabel('Tempo[s]')
ylabel('Temperatura[ºC]')
legend('Resposta 1','Resposta 2','Resposta 3')
grid on
