%% EX Aula 2 Controle Moderno
%% Conjunto de dados
u = [1   0.8 0.6 0.4 0.2 0   0.2 0.4 0.6 0.8 1   0.8 0.6 0.4 0.2];
y = [0.9 2.5 2.4 1.3 1.2 0.8 0   0.9 1.4 1.9 2.3 2.4 2.3 1.3 1.2];
%% Funçao de transferencia estimada
syms b0 b1 
%y == b0*u(t) + b1*u(t-1);

% Estimando Val de B(s)

Qtd = 2;
QtdMax = 14;
for t = Qtd : 1 : QtdMax
    E(t) =  y(t) == b0*u(t) + b1*u(t-1);
end

for t = Qtd : 1 : QtdMax -1
    res = solve(E(t),E(t+1));
    B0(t) = res.b0;
    B1(t) = res.b1;
end

% Plotando Grafico 
for t = Qtd : 1 : QtdMax - 1
    Y(t) = B0(t)*u(t) + B1(t)*u(t-1);
end

X = linspace(1,length(Y),length(Y));
plot(X,Y)


%% Metodo do gradiente 
Grad = gradient(y)


