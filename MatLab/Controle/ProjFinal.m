
clear
clc
close all

%% Variaveis      
b = 2.5316;
M = 1.12;     % Massa do carro  (kg)
m = 0.12;    % massa da haste (kg)
I = 0.01233;  % Momento de Inercia (kg.m^2)
g = 9.81;     % Gravidade (m/s^2)
l = 0.146;    % Largura da haste (m)
q = ((M+m)*(I+m*l^2))-((m*l)^2);
t=0:0.001:1;
t1= 0:0.001:10;
%% Função Transferencia Malha Fechada (ganho unitario) 
s = tf('s'); % configura o s para funcionar como uma FT

%num= ((m*l));
%den = (-((((m+M)*I) + (M*m*(l^2)))*s^2) + (((m+M)*m*g*l)*s) + (m*l));
%Ft = num / den;
num = [(-0.01752)];
den = [0.01815 (-0.2131) (-0.01752)];

%num=[0 0 -0.9649 0 0];
%den=[1 -11.7378 0 0 0];

%num = (m*l*s/q);
%den = (s^3 + ((b*(I + m*l^2))*s^2/q) - (((M + m)*m*g*l)*s/q) - (b*m*g*l/q));
%Ft = num / den;

%num = [0.0001674 0];
%den = [0.0001055 (5.247e-06) (- 0.003696) (- 0.0001643)];

Ft = tf(num,den);
[z,p,k] = tf2zp(num,den);
%zeros = []
%polos = [11.8227 -0.0816]

%% Especificaçoes para Controlador Ideal 
Mp = 0.25; % 25% Sobressinal Maximo 
ts = 1;    % Tempo de acomodação 

zeta = sqrt(((log(Mp)^2))/((pi^2)+(log(Mp)^2))); % Calculo do Zeta desejado

Wn = 4/(ts*zeta);         % Calculo do Wn

Pd = -(zeta*Wn)+ (Wn*sqrt(1-(zeta^2)))*1j; % Calculo do polo desejado

numv=[0 0 (Wn*Wn)];
denv=[1 (2*zeta*Wn) (Wn*Wn)];
fv=tf(numv,denv);                   %Ft ideal 
[k,r]=rlocfind(Ft,Pd);              %Descobrir Kp 

%% Controlador PD 

Kp = 186.4464;
Ki = 0;
Kd = 1;
C = pid(Kp,Ki,Kd);
T = feedback(fv,C);

%% Controlador PID 




%% Plots
figure(1)
impulse(Ft,t);
title({'Resposta para um degrau unitário'});

figure(2)
rlocus(Ft);
title({'lugar das raizes em malha fechada'});

figure(3)
impulse(T,t);
title({'Resposta controlador pd'});

figure(4)
%impulse(T,t);
title({'Resposta controlador pid'});

figure(5)
impulse(fv,t);
title({'Resposta controlador ideal'});

