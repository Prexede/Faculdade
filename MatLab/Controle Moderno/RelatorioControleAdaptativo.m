%% Exp 1 Modelo Parametrico SPM
close all; clear; clc;
%% Parametros do sistema
M = 100;
f = 0.15;
k = 7;
dt = 0.001;
t = 0:dt:25;
% Entrada 
u = 1+cos(pi*t/3);

%% Planta
G = tf(1,[M f k]);
x = lsim(G,u,t);
%% Valores Iniciais

lambda = 0.5;
%z = lsim((tf([1],[1 2*lambda lambda^2])), u, t);
z = u;
phi1 = lsim(tf([1 0 0],[1 2*lambda lambda^2]) , x, t);
phi2 = lsim(tf([1 0],[1 2*lambda lambda^2]) , x, t);
phi3 = lsim(tf([1],[1 2*lambda lambda^2]) , x, t);

phi = [phi1';phi2';phi3'];
%plot(t,phi1,t,phi2,t,phi3)

%% Estimação de parametros
% Valor de estimativa inicial thteta0 e constantes de projeto
P(1) = 1;
ms = 1;
zChapeu(1) = 0;

theta = [0 0 0; 0 0 0; 0 0 0];
for i = 2:length(t)+1
    dp = -P(i-1)*phi(:,i-1)'*phi(:,i-1)*P(i-1);
    P(i) = dp + P(i-1);
    zChapeu(i-1) = theta(i-1,:)*phi(:,i-1);
    e(i-1) = z(i-1) - zChapeu(i-1);
    dT = P(i-1)*e(i-1)*phi(:,i-1);
    theta(i,:) = dT' + theta(i-1,:);
end
theta((length(t)+1),:) = [];
plot(t,z,t,zChapeu)
