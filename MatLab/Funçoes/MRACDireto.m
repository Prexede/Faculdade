function [x,xm,e,L,lponto,K,kponto] = MRACDireto(a,b,x0,am,bm,r,t,dt,plot)

%Parametros entrada
Ft = tf([b],[1 a]);
x = lsim(Ft,r,t);
x(1) = x0;


%Parametros Modelo
Ftm = tf([bm],[1 am]);
xm = lsim(Ftm,r,t);
xm(1) = 0;

%% MRAC DIRETO

%Passos de adaptação
g1 = 100;
g2 = 5;

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
% Ajuste ultimo erro
e(i) = x(i) - xm(i);

%Valores de referencia
lponto = bm/b*ones(length(xm));
kponto = (am + a / b)*ones(length(xm));

%% Plots
if plot 
    %Posição 
    figure
    hold on
    subplot(2,1,1)
    plot(t, xm,'b--' ,t,x,'r');
    title("Modelo de referencia x Saida controlada");
    xlabel("Tempo [s]");
    ylabel("Amplitude");
    legend('X(t)','Xm(t)')

    subplot(2,1,2)
    plot(t, xm,'b--' ,t,x,'r');
    title("Modelo de referencia x Saida controlada (Com 'zoom' no inicio)");
    xlabel("Tempo [s]");
    ylabel("Amplitude");
    xlim([0 1])
    legend('X(t)','Xm(t)')

    figure
    plot(t, lponto,'b--' ,t,L,'r');
    title("Variaveis de Adaptação l* e L(t)");
    xlabel("Tempo [s]");
    ylabel("Amplitude");
    legend('l*','L(t)');

end

