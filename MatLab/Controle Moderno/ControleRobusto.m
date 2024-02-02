%% RELATORIO CONTROLE ROBUSTO
clc;clear;close all
%Modelo nominal da planta dinamica em espaço de estados
A = [1 0 0;     
    0 3 1;
    2 0 6];

B = [1 0;
    0 1;
    1 1];

C = [1 0 0;
    0 1 0];

D = [0 0;
    0 0];

sys = ss(A,B,C,D);

%% Controlabilidade 
% O sistema é controlavel se o posto da matriz de controlabilidade Cx é
% igual a n, ou seja, se Cx tem posto pleno(determinante diferente de zero)
% Cx = [B AB A^2B ...]
% Criando matriz de controlabilidade
Cx = ctrb(A,B);
% Vendo qual é numero de linhas ou colunas linearmente independentes 
% Caso valor >= n(dimensão da matriz A
rank(Cx);
% Pode-se verificar se o determinante é diferente de 0(depende do sistema)
%det(Cx)
% OU se tivermos n numeros singulares e não nulos
cx = svd(Cx);

%% Observabilidade
% O sistema é observavel se todas as variaveis de estado contribuirem para
% a saida do processo
% Ox = [C; CA CA^2 CA^3...]
% Criando matriz de controlabilidade
Ox = obsv(A,C);
% Vendo qual é numero de linhas ou colunas linearmente independentes 
% Caso valor >= n(dimensão da matriz A
rank(Ox);
% Pode-se verificar se o determinante é diferente de 0(depende do sistema)
%det(Ox)
% OU se tivermos n numeros singulares e não nulos
ox = svd(Ox);

%% Criterio de Nyquist Multivariavel 
%O sistema será assintoticamente estável se todas as raízes de estiverem no
%semiplano esquerdo aberto.
%Temos que a estabilidade do sistema nominal é dado pela analise dos polos
%quando o diagrama de nyquist é dado por
% nyq = -1 + det[I + G(s)]
G = tf(sys);
mat = eye(2,2) + G;
% Vou tirar o determinante do symbolab rs rs
% Função final ja 
nyq = tf([-2 14 -18],[1 -10 27 -18]);
nyquist(nyq);
% O numero de polos instaveis = 3 
% O numero de vezes que o diagrama envolve o -1 = 0
% Logo o sistema é estavel




