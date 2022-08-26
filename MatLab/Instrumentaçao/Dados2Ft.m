function Dados2Ft

%% Entrada de dados
Dados = [ 27.8
27.9
28.9
30.8
32.5
34.2
35.5
36.7
37.8
38.8
39.6
40.3
41
41.5
41.9
42.4
42.8
43.1
43.3
43.6
43.8
44
44.2
44.5
44.6
44.7
44.9
45
45
45.1
45.2
45.3
45.4
45.4
45.5
45.6 ];

x = [0:10:350]; %% Vetor de tempo


%% Parametros 
L = 10; %% Tempo morto
K = (max(Dados) - min(Dados));  %% (45.6-27.9) 
T = 85;  %% 100 - 15 

%% Função transferencia 
num = [1];
den = [T 1];

G = K*tf(num,den,'inputdelay',L);

%% Plot dos graficos
step(G+27.8)

hold on
xlim([0,350]);
title('Comparaçao dados reais por Ft')
xlabel('T(s)')
ylabel('Temperatura(Cº)')
grid()
legend('Ft Encontrada', 'Dados Experimentais')

plot(x,Dados,'r')

