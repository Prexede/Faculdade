function PI

%   Sintaxe:
%
%   Função de Transferencia,Sobressinal,Tempo de pico/Tempo de assentamento
%   PI(num,den,S,Tp/Ts)   
%
%   Observações:
%    
%   Projeto de um compensador PI pelo Método da Resposta em Frequência
%
%   Exemplo:
%   num = [144000];
%   den = [1 136 3600 0];
%   S = 20;
%   Tp = 0.1;
%
%   Dependências:
%
%   Desenvolvida por: Carlos Eduardo
%   Data: 17/03/2022
%   Última modificação: 

%   Musica/Playlist do momento: A vida é um moinho - Cartola
%% Definiçao Variaveis 

%Numerador e Denominador da nossa Função de Transferencia
num = [5832];
den = [1 136 3600 0];

%Sobressinal
S = 9.5;

%Funçao 
Ft = tf(num,den);
[Mag,Phase,w] = bode(Ft);

%Zeta
zeta = sqrt((log(S/100)^2)/((pi^2)+(log(S/100)^2)));

%Margem de fase
mf = atan((2*zeta)/(sqrt((-2*zeta^2)+(sqrt(1+(4*zeta^4))))));
mf = mf*180/pi; %conversao rad/grau 

%Contribuição do Compensador
Pc = - 180 + (mf + 10); 

%Encontrando frequencia onde ocorre a Pc 
m = 1;
    while (Phase(m) > Pc)
        m = m+1;
    end     
Wmf = w(m-1);
Wmf = 9.6;
%Frequencia de Corte
Wc = Wmf*0.1;

%Magnitude na Freq do Pc
M = 20*log10(Mag(m-1));           

%Ganho K
N = abs((j*Wmf)+Wc);
D = abs(j*Wmf);

K = ((10^(M/20))*(N/D));

%Controlador PI
numPi = K*[1 Wc];
denPi = [1 0];

Gpi = tf(numPi,denPi);

%Sistema compensado 
TfPi = series(Gpi,Ft);

%Fechando a malha
TfPiF = TfPi/(1 + TfPi);

%Plot dos graficos 
figure(1)
bode(Ft,'r',TfPi,'b')

figure(2)
step(TfPiF,'g')

