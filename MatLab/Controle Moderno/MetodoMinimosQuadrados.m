%% Experiência 4
clc;clear;close all
Ex = input("Qual exercício ?( Experiência 4 e 5): ");
if Ex == 4
%Parâmetros do sistema
M = 100; f = 0.15; k = 7;
%Tempo de simulação
dt = 0.1; t = 0:dt:25;

%Entrada do sistema 
u = 1+cos(pi*(t/3));

%Modelo de referência 
Ft = tf(1,[M f k]);
x = lsim(Ft,u,t);

%Filtro
lambda = 0.1;

Ft2 = tf([1 0 0],[1 2*lambda lambda^2]);

Ft1 = tf([1 0],[1 2*lambda lambda^2]);

Ft0 = tf([1],[1 2*lambda lambda^2]);

%Saida ajustada com filtro
u = lsim(Ft0,u,t);

%Matriz de valores conhecidos 
phi = [lsim(x,Ft2,t)'; lsim(x,Ft1,t)' ;lsim(x,Ft0,t)'];

end
%% Experiência 5
if Ex == 5
% Especificações da planta
J = 0.001; b = 0.268; Ra = 1.36; La = 3.6*10^-3; Km = 0.838; Kb = Km;

K1 = Km/(J*La); K2 = (J*Ra + b*La)/(J*La); K3 = (Kb*Km)/J*La;

% Tempo de simulação
dt = 0.01; t = 0:dt:60;
% Tensão de armadura 
Va = sin((pi*t)/3);

%Modelo de referência 
Ft = tf(K1,[1 K2 K3]);
w = lsim(Ft,Va,t);

%Ajuste para variaveis utilizadas
x = w;
u = Va;

%Filtro
lambda = 0.1;

Ft2 = tf([1 0 0],[1 2*lambda lambda^2]);

Ft1 = tf([1 0],[1 2*lambda lambda^2]);

Ft0 = tf([1],[1 2*lambda lambda^2]);

%Saida ajustada com filtro
u = lsim(Ft0,u,t);

%Matriz de valores conhecidos 
phi = [lsim(x,Ft2,t)'; lsim(x,Ft1,t)' ;lsim(x,Ft0,t)'];

end

%% Metodo dos mínimos quadrados recursivo

%Criação do vetor de adaptação
P = 1*[1    0    0;
       0    1    0;
       0    0    1];
   
%Inicialização de parâmetros 
zChapeu(1) = 0;
theta = [0.01;0.01;0.01];
%Começando em 0.01 pra evitar divisão por 0 em alguma etapa

for i = 2:length(t)
    %Determinação de matriz de covariância
    dp = -P*phi(:,i-1)*phi(:,i-1)'*P;
    P = dp*dt + P;
    
    zChapeu(i-1) = theta(:,i-1)'*phi(:,i-1);
   %e(i-1) = (u(i-1) - zChapeu(i-1))/(1 + phi(:,i-1)'*phi(:,i-1));
    e(i-1) = (u(i-1) - zChapeu(i-1));
    
    dT = P*e(i-1)*phi(:,i-1);
    theta(:,i) = dT + theta(:,i-1);
end

%Ajuste de valores finais
zChapeu(i) = theta(:,i)'*phi(:,i);
e(i) = u(i) - zChapeu(i);

%% Plots
%Posição 
figure
hold on
plot(t, zChapeu,'b--' ,t,u,'r');
title("Modelo de referencia x Saida controlada");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('zChapeu(t)','z(t)')
grid on

%Erro
figure
hold on
plot(t,e);
title("Erro do modelo");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('e(t)')
grid on

if Ex == 4 
    Exp4(M,f,k,t,theta);
end
if Ex == 5
    Exp5(K1,K2,K3,t,theta);
end

%% Experiência 4 
function Exp4(M,f,k,t,theta)
%Massa
Mvet = M*ones(length(t),1);
figure
hold on
plot(t, theta(1,:),'b--' ,t,Mvet,'r');
title("Parâmetro estimado x Valor de massa do modelo");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('Mchapeu','Mreal')
grid on

%Coeficiente de amortecimento
fvet = f*ones(length(t),1);
figure
hold on
plot(t, theta(2,:),'b--' ,t,fvet,'r');
title("Parâmetro estimado x Valor de amortecimento do modelo");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('fchapeu','freal')
grid on

%Constante da mola
kvet = k*ones(length(t),1);
figure
hold on
plot(t, theta(3,:),'b--' ,t,kvet,'r');
title("Parâmetro estimado x Valor de constante da mola do modelo");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('kchapeu','kreal')
grid on

end

%% Experiência 5
function Exp5(K1,K2,K3,t,theta)
%K1
K1vet = K1*ones(length(t),1);
figure
hold on
debug = 1./theta(1,:);
plot(t, debug,'b--' ,t,K1vet,'r');
title("Parâmetro estimado x Valor de K1 do modelo");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('K1chapeu','K1real')
grid on

%K2
K2vet = K2*ones(length(t),1);
figure
hold on
plot(t, K1*theta(2,:),'b--' ,t,K2vet,'r');
title("Parâmetro estimado x Valor de K2 do modelo");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('K2chapeu','K2real')
grid on

%Constante da mola
K3vet = K3*ones(length(t),1);
figure
hold on
plot(t, K1*theta(3,:),'b--' ,t,K3vet,'r');
title("Parâmetro estimado x Valor de K3 do modelo");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('K3chapeu','K3real')
grid on

end