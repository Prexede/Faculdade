
clear
clc
close all

%Variaveis
m = 0.25 ;       % massa da haste (kg)
M = 2 ;      % Massa do carro  (kg)
l = 0.3 ;       % Largura da haste (m)
g = 9.81 ;       % Gravidade (m/s^2)
I = 0.001 ;      % Momento de Inercia (kg.m^2) 

%% Planta Malha Aberta
num = [(m*l)];                                      %Numerador da FT
den = [-(((m+M)*I) + (M*m*(l^2))) ((m+M)*m*g*l) 0]; %Denominador da FT 
Ft = tf(num,den);                                 %Definindo a FT
[z,p,k] = tf2zp(num,den);                           % Zeros, ganho e polos

figure(1)
zplane(num,den)
title('Grafico de Polos e Zeros Funçao transferencia');
xlabel('Parte Real');
ylabel('Parte Imaginaria');

figure(2)
step(Ft);
title('resposta ao degrau unitario da FT')
%rlocus(num,den);

%Zeros = []
%Polos = [0 35.0357]
%Sistema Instavel


%% Planta Malha Fechada
numf = [(m*l)];                                      %Numerador da FT
denf = [-(((m+M)*I) + (M*m*(l^2))) ((m+M)*m*g*l) (m*l)]; %Denominador da FT 
Ft = tf(numf,denf);                                 %Definindo a FT
[zf,pf,kf] = tf2zp(numf,denf);                           % Zeros, ganho e polos

figure(3)
zplane(numf,denf)
title('Grafico de Polos e Zeros Funçao transferencia (MF)');
xlabel('Parte Real');
ylabel('Parte Imaginaria');

figure(4)
step(Ft);
title('resposta ao degrau unitario da FT (MF)')

%Zeros = []
%Polos = [-0.0452 35.081]
%Sistema Instavel



%% Especificaçoes para Controlador Ideal 
Mp = 0.15; %15% Sobressinal Maximo 
ts = 1;    % Tempo de acomodação 

zeta = sqrt(((log(Mp)^2))/((pi^2)+(log(Mp)^2))); % Calculo do Zeta desejado

Wn = 4/(ts*zeta);         % Calculo do Wn

Pd = -(zeta*Wn)+ (Wn*sqrt(1-(zeta^2)))*1j; % Calculo do polo desejado

numv=[0 0 Wn^2];
denv=[1 2*zeta*Wn Wn^2];
fv=tf(numv,denv);

figure(5)
step(fv)
title('Resposta desejada')
xlabel('Tempo[s]');
ylabel('Angulo[theta]');

[z,p,k] = tf2zp(numv,denv);                           % Zeros, ganho e polos

figure(6)
zplane(numv,denv)
title('Grafico de Polos e Zeros Funçao transferencia com resposta esperada');
xlabel('Parte Real');
ylabel('Parte Imaginaria');


%% Controlador PD

Pd = 