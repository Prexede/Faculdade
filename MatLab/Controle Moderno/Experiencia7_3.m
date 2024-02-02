%% Experiencia 7 - 3
Ex = 'a';
if Ex == 'a'
    clc;close all;
    %Condicoes de inicio
    dt = 0.01;
    t = 0:dt:10;

    %Entrada
    Vs = 50*ones(length(t),1);
    %Vs = sin(t);
    r = Vs;
    
    % Parametros do modelo
    am = 0.5;
    bm = 0.5;

    Ftm = tf([bm],[1 am]);
    xm = lsim(Ftm,r,t);
    xm(1) = 0;

    %Parametros da planta
    a = 2;
    b = 5;
    
    Ft = tf([b],[1 a]);
    x = lsim(Ft,r,t);
    x(1) = 0;
    
    %Disturbio
    d = 10;
    %px = x + d;
    %x = px;
end

% %% MRAC Direto 
% 
% %Passos de adaptação
% g1 = 0.08;
% g2 = 0.04;
% g3 = 1;
% 
% %Condições iniciais 
% K(1) = 0;
% L(1) = 0;
% D(1) = 0;
% 
% %Loop de controle
% for i = 2:length(xm)
%     % Erro
%     e(i-1) = x(i-1) - xm(i-1);
%     
%     % Lei de adaptação
%     klinha = g1 * e(i-1) * x(i-1) * sign(b);
%     llinha = -g2 * e(i-1) * r(i-1) * sign(b);
%     dlinha = -g3 * e(i-1) * sign(b);
%     
%     K(i) = K(i-1) + klinha*dt;
%     L(i) = L(i-1) + llinha*dt;
%     D(i) = D(i-1) + dlinha*dt;
%     
%     %Ação de controle
%     u = -K(i)*x(i-1) + L(i)*r(i-1) + D(i);
%     
%     %Saida controlada
%     x(i) = x(i-1) + (-a*x(i-1) + b*u + d)*dt;
%     
% end
% 
% lponto = bm/b*ones(length(xm));
% kponto = (am + a / b)*ones(length(xm));
% dponto = (-d/b)*ones(length(xm));
% %Ajuste ultimo erro
% e(i) = x(i) - xm(i);

%% MRAC INDIRETO

%Passos de adaptação (exp 7b)
g1 = 1;
g2 = 1;
g3 = 1;
%Condições iniciais 
K(1) = 1;
L(1) = 1;
D(1) = 1;

u(1) = 0;

a_hat(1) = 0;
b_hat(1) = 0;
d_hat(1) = 0;

%Loop de controle
for i = 2:length(xm)
    % Erro
    e(i-1) = x(i-1) - xm(i-1);
    ea(i-1) = a_hat(i-1) - am;
    eb(i-1) = b_hat(i-1) - bm;
    ed(i-1) = d_hat(i-1) - d;
    
    % Lei de adaptação
    da_hat = g1*ea(i-1)*x(i-1);
    if (abs(b_hat(i-1)) > b(1)) || (abs(b_hat(i-1)) == b(1) && e(i-1)*u(i-1)*sign(b) >= 0)  
        db_hat = g2*eb(i-1)*u(i-1);
    else 
        db_hat = 0;
    end
    dd_hat = g3*ed(i-1);
     
    a_hat(i) = a_hat(i-1) + da_hat*dt;
    b_hat(i) = b_hat(i-1) + db_hat*dt;
    d_hat(i) = d_hat(i-1) + dd_hat*dt;
   
    
    K(i) = (am + a_hat(i))/b_hat(i);
    L(i) = bm/b_hat(i);
    D(i) = -d/b_hat(i);
    
    %Ação de controle
    u(i) = -K(i)*x(i-1) + L(i)*r(i-1);
    
    %Saida controlada
    x(i) = x(i-1) + (a*x(i-1) + b*u(i))*dt;
    
end

lponto = bm/b*ones(length(xm));
kponto = (am + a / b)*ones(length(xm));
%Ajuste ultimo erro
e(i) = x(i) - xm(i);
ea(i) = am - a_hat(i);
eb(i) = bm - b_hat(i);


%plot(t,r,t,x,t,px)
%plot(t,kponto,t,K)
%plot(t,lponto,t,L)
plot(t,x,t,r,t,xm)
