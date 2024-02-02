%% Experiencia 7a
Ex = input("Qual exercício?: ");
if Ex == 1
    clc;close all;
    %Condicoes de inicio
    dt = 0.01;
    t = 0:dt:10;

    %Entrada de referencia
    r = 5*cos(t) + 2*sin(pi*t);

    % Parametros do modelo
    am = 10;
    bm = 1;
    
    %Criação da função de transferencia do modelo
    Ftm = tf([bm],[1 am]);
    xm = lsim(Ftm,r,t);
    xm(1) = 0;

    %Parametros da planta
    a = input("Qual polo?: (a = -1 ou a = 2): ");
    %a = -1;
    %a = 2;
    b = 5;

    %Criação da função de transferencia do modelo
    Ft = tf([b],[1 a]);
    x = lsim(Ft,r,t);
    x(1) = 0;
end

%% Experiencia 7b
if Ex == 2
    clc;close all;
    %Condicoes de inicio
    dt = 0.01;
    t = 0:dt:10;

    %Entrada de referencia
    %r = sin(2*t);

    % = 5*ones(length(t),1);

    for i = 1:length(t)
        r(i) = 1/(1+t(i));
    end

    % Parametros do modelo
    am = 2;
    bm = 2;

    Ftm = tf([bm],[1 am]);
    xm = lsim(Ftm,r,t);
    xm(1) = 0;

    %Parametros da planta
    a = -1;
    b = 12;

    Ft = tf([b],[1 a]);
    x = lsim(Ft,r,t);
    x(1) = 0;
end


%% MRAC DIRETO

%Passos de adaptação (exp 7)
%g1 = 100;
%g2 = 0.5;

%Passos de adaptação (exp 7b)
g1 = 100;
g2 = 10;

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
    
    %Ação de controle
    u = -K(i)*x(i-1) + L(i)*r(i-1);
    
    %Saida controlada
    x(i) = x(i-1) + (a*x(i-1) + b*u)*dt;
    
end

lponto = bm/b*ones(length(xm));
kponto = (am + a / b)*ones(length(xm));
%Ajuste ultimo erro
e(i) = x(i) - xm(i);

%% Plots

%Posição 
figure
hold on
subplot(2,1,1)
plot(t, xm,'b--' ,t,x,'r');
title("Modelo de referencia x Saida controlada");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('X(t)','Xm(t)')
grid on

subplot(2,1,2)
plot(t, xm,'b--' ,t,x,'r');
title("Modelo de referencia x Saida controlada (Com 'zoom' no inicio)");
xlabel("Tempo [s]");
ylabel("Amplitude");
xlim([0 1])
legend('X(t)','Xm(t)')
grid on

% Erro
figure
hold on
plot(t, e);
title("Erro do modelo real x referencia");
xlabel("Tempo [s]");
ylabel("Amplitude");
grid on


% Variaveis de adaptação
figure
subplot(2,1,1)
plot(t, lponto,'b--' ,t,L,'r');
title("Variaveis de Adaptação l* e L(t)");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('l*','L(t)');
%ylim([0,0.7])
grid on

subplot(2,1,2)
plot(t, kponto,'b--' ,t,K,'r');
title("Variaveis de Adaptação k* e K(t)");
xlabel("Tempo [s]");
ylabel("Amplitude");
legend('k*','K(t)');
%ylim([0,12])
grid on
