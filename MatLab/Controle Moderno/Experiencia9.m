%% Experiencia 9a
clc;clear;close all
%Ex = input("Qual exercício?: ");
Ex =1;
if Ex == 1
    clc;close all;
    %Condicoes de inicio
    dt = 0.01;
    t = 0:dt:40;

    %Entrada de referencia
    r = 2*sin(10*t) + 5*sin(3*t);
    %r = 15*ones(length(t),1);
    %r = sin(t);
    
    % Parametros do modelo
    am = 6.7;
    bm = 3.3;
    
    %Criação da função de transferencia do modelo
    Ftm = tf([bm],[1 am]);
    xm = lsim(Ftm,r,t);
    xm(1) = 0;

    %Parametros da planta
    %a = input("Qual polo?: ");
    %b = input("Qual zero?: ");
    a = 1;
    b = 5;
    
    %Criação da função de transferencia do modelo
    Ft = tf([b],[1 a]);
    x = lsim(Ft,r,t);
    x(1) = 0;
    
    %Determinação de K e L 
    Kideal = (am + a)/b;
    Lideal = bm/b;
end

%% MRAC DIRETO

%Passos de adaptação
g1 = 100;
g2 = 100;

%Condições iniciais 
K(1) = 0;
L(1) = 0;

%Loop de controle
for i = 2:length(xm)
    % Erro
    e(i-1) = x(i-1) - xm(i-1);
    
    % Lei de adaptação
    klinha = g1 * e(i-1) * x(i-1) * sign(b);
    llinha = -g2 * e(i-1) * r(i-1) * sign(b);
    
    K(i) = K(i-1) + klinha*dt;
    L(i) = L(i-1) + llinha*dt;
    KD(i) = K(i);
    LD(i) = L(i);
    
    %Ação de controle
    u = -K(i)*x(i-1) + L(i)*r(i-1);
    uD(i) = u;
    
    %Saida controlada
    x(i) = x(i-1) + (a*x(i-1) + b*u)*dt;
    xD(i) = x(i);
end

lponto = bm/b*ones(length(xm));
kponto = (am + a / b)*ones(length(xm));
%Ajuste ultimo erro
e(i) = x(i) - xm(i);
eD = e;

%% MRAC INDIRETO

%Passos de adaptação (exp 7b)
g1 = 10;
g2 = 10;

%Condições iniciais 
K(1) = 0;
L(1) = 0;
u(1) = 0;

a_hat(1) = 1;
b_hat(1) = 1;

%Loop de controle
for i = 2:length(xm)
    % Erro
    e(i-1) = x(i-1) - xm(i-1);
    
    % Lei de adaptação
    da_hat = g1*e(i-1)*x(i-1);
    if (abs(b_hat(i-1)) > b(1)) || (abs(b_hat(i-1)) == b(1) && e(i-1)*u(i-1)*sign(b) >= 0)  
        db_hat = g2*e(i-1)*u(i-1);
    else 
        db_hat = 0;
    end
     
    a_hat(i) = a_hat(i-1) + da_hat*dt;
    b_hat(i) = b_hat(i-1) + db_hat*dt;
   
    
    K(i) = (am + a_hat(i))/b_hat(i);
    L(i) = bm/b_hat(i);
    KI(i) = K(i);
    LI(i) = L(i);
    
    %Ação de controle
    u(i) = -K(i)*x(i-1) + L(i)*r(i-1);
    uI(i) = u(i);
    
    %Saida controlada
    x(i) = x(i-1) + (a*x(i-1) + b*u(i))*dt;
    xI(i) = x(i);
end

lponto = bm/b*ones(length(xm));
kponto = (am + a / b)*ones(length(xm));
%Ajuste ultimo erro
e(i) = x(i) - xm(i);
eI = e;
%% Plots
close all
%Posição 
figure
hold on
subplot(2,1,1)
plot(t, xm,'b--' ,t,xD,'r',t,xI,'g');
title("Modelo de referencia x Saida controlada");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('Xm(t)','XMracDireto(t)','XMracIndireto(t)')
grid on

subplot(2,1,2)
plot(t, xm,'b--' ,t,xD,'r',t,xI,'g');
title("Modelo de referencia x Saida controlada (Com 'zoom' no inicio)");
xlabel("Tempo [s]");
ylabel("Amplitude");
xlim([0 1])
legend('Xm(t)','XMracDireto(t)','XMracIndireto(t)')
grid on

%Erro
figure
hold on
subplot(2,1,1)
plot(t, eD,'r',t,eI,'g');
title("Erro do modelo real x referência");
xlabel("Tempo [s]");
ylabel("Amplitude");
xlim([0 10])
legend('XMracDireto(t)','XMracIndireto(t)')
grid on

%Ação de controle
hold on
subplot(2,1,2)
plot(t, uD,'r',t,uI,'g');
title("Ação de controle");
xlabel("Tempo [s]");
ylabel("Amplitude");
xlim([0 10])
legend('XMracDireto(t)','XMracIndireto(t)')
grid on


% % Variaveis de adaptação
figure
subplot(2,1,1)
plot(t,lponto,'b--',t, LD,'r-',t, LI,'g');
title("Variaveis de Adaptação L(t) e L*");
xlabel("Tempo [s]");
ylabel("Amplitude");
xlim([0 10]);
legend('L ideal','XMracDireto(t)','XMracIndireto(t)');
grid on

% % Variaveis de adaptação
subplot(2,1,2)
plot(t,kponto,'b--',t, KD,'r-',t, KI,'g');
title("Variaveis de Adaptação K(t) e K*");
xlabel("Tempo [s]");
ylabel("Amplitude");
xlim([0 10])
legend('K ideal','XMracDireto(t)','XMracIndireto(t)');
grid on
