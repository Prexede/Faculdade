function PD

%   Sintaxe:
%
%   Função de Transferencia,Sobressinal,Tempo de pico/Tempo de assentamento
%   PD(num,den,S,Tp/Ts)   
%
%   Observações:
%    
%   Projeto de um compensador PD pelo Método da Resposta em Frequência
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
num = [144000];
den = [1 136 3600 0];

%Sobressinal
S = 20;

%Tempo de Assentamento
Ts = 2;

%Tempo de Pico
Tp = 0.1;

%Funçao 
Ft = tf(num,den);

%Zeta
zeta = sqrt((log(S/100)^2)/((pi^2)+(log(S/100)^2)));

%Margem de fase
mf = atan((2*zeta)/(sqrt((-2*zeta^2)+(sqrt(1+(4*zeta^4))))));
mf = mf*180/pi; %conversao rad/grau


%Banda Passante(por T resposta transitoria)
%Wbw = 4/(Ts*zeta);
%Wbw = Wbw*sqrt((1-(2*zeta^2))+sqrt(4*zeta^4-(4*zeta^2)+2));

%Banda Passante(por tempo de pico)
Wbw = pi/(Tp*sqrt(1-zeta^2));
Wbw = Wbw*sqrt((1-(2*zeta^2))+sqrt(4*zeta^4-(4*zeta^2)+2));

%Frequencia MalhaFechada
Wmf=0.8*Wbw;  

%% Compensador
%Fase Atual na frequencia desejada
[Mag,Phase] = bode(Ft,Wmf);

%Contribuição do Compensador 
Pc = mf - (180+Phase) + 5;

%Ganho compensador 
Kd = tand(Pc)/Wmf;

%Compensador 
numPd = Kd*[1 1/Kd];
denPd = [1];
Gpd = tf(numPd,denPd);

%Sistema compensado 
TfPd = series(Gpd,Ft);

%Ajuste de ganho
[M,P] = bode(TfPd,Wmf);
Kk = (M);

%Sistema compensado c/ ajuste de ganho 
TfPdK = TfPd*Kk;

%Fechando a malha
TfPdF = TfPd/(1 + TfPd);
TfPdKF = TfPdK/(1 + TfPdK);

%Plot dos graficos 
figure(1)
bode(Ft,'r',TfPd,'b',TfPdK,'g')

figure(2)
step(TfPdF,'b',TfPdKF,'g')












