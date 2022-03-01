function Proj1
%%
%   Sintaxe:
%
%   
%
%   Observações:
%
%   
%   
%
%   Exemplo:
%
%   
%   Dependências:
%
%  
%
%
%   Desenvolvida por: 
%   Data: 
%   Última modificação:


%% Definiçao Variaveis 

num = [40];
den = [1 40 0 0];
S = 15;
Ts = 2;

%Funçao 
Ft = tf(num,den);

%Zeta
zeta = sqrt((log(S/100)^2)/((pi^2)+(log(S/100)^2)));

%Margem de fase
mf = atan((2*zeta)/(sqrt((-2*zeta^2)+(sqrt(1+(4*zeta^4))))));
mf = mf*180/pi; %conversao rad/grau

%Banda Passante(por T resposta transitoria)
Wbw = 4/(Ts*zeta);
Wbw = Wbw*sqrt((1-(2*zeta^2))+sqrt(4*zeta^4-(4*zeta^2)+2));

%Banda Passante(por tempo de pico)
% Wbw = pi/(Tp*sqrt(1-zeta^2));
% Wbw = Wbw*sqrt((1-(2*zeta^2))+sqrt(4*zeta^4-(4*zeta^2)+2)); 

 
    
%% Avanço de Fase

%Frequencia MalhaFechada
Wmf=0.8*Wbw;  
[Mag,Fase] = bode(Ft,Wmf);

angmax = mf - (180 + Fase)+ 8 ;
angmax = angmax*pi/180;

%Beta
beta=(1-sin(angmax))/(1+sin(angmax));  

%Gama
gama=1/beta;   

%Tav 
Tav=sqrt(beta)*Wmf;

%Definição Compensador de Avanço de fase
numAv=[1 Tav];
denAv=[1 gama*Tav];
CompAv=tf(gama*numAv,denAv);  %MUDEI AQUI O 1/B

%% Atraso de Fase
Tat=0.1*Wmf;
numAt=[1 Tat];                      %Sa merda ta instavel ou ta errado 
denAt=[1 Tat/gama];
CompAt=tf(beta*numAt,denAt);

%% Avanço e Atraso de fase
Wmf=0.75*Wbw; 
angmax = mf - (180 + Fase)+ 12 ;       %CHORINHO DIFERENCIADO PRA CABER
angmax = angmax*pi/180;
%Beta
beta=(1-sin(angmax))/(1+sin(angmax));  
%Gama
gama=1/beta;   
%Tav 
Tav=sqrt(beta)*Wmf;

%Definição do compensador de avanço de fase
numGav = [1 Tav];
denGav = [1 gama*Tav];
Gav = tf(numGav,denGav);

%Definição do compensador de atraso de fase
numGat = [1 Tav];
denGat = [1 Tav/gama];
Gat = tf(numGat,denGat);

%% Funçoes

%Ft com Avanço de fase
FtAv = (Ft*CompAv);
%Ft com Avanço de fase e ajuste de ganho
FtAvK = (Ft*CompAv*5.62);

%Ft com Atraso de fase
FtAt = (Ft*CompAt);
%Ft com Atraso de fase e ajuste de ganho
FtAtK = (Ft*CompAt*0.00013);

%Ft com Atraso e Avanço de fase
FtAtv = (Ft*Gat*Gav);
%Ft com Atraso e Avanço de fase e ajuste de ganho
FtAtvK = (Ft*Gat*Gav*151.35);

%% Resposta no tempo
%Ft principal
FtMf = Ft/(1+Ft);

%Ft Avanço
FtAvMf = FtAv/(1 + FtAv);
FtAvMfK = FtAvK/(1 + FtAvK);

%Ft Atraso
FtAtMf = FtAt/(1 + FtAt);
FtAtMfK = FtAtK/(1 + FtAtK);

%Ft Atraso e Avanço
FtAtvMf = FtAtv/(1 + FtAtv);
FtAtvMfK = FtAtvK/(1 + FtAtvK);

%% Plot Graficos

%% Ajuste de Ganho K (ERRADO)
% for i = 1:60
%     if Fase1(i) == (round(mf,2) - 180)
%     K = Mag1(i);   
%     end
% end  
%%   Testes
figure(1)
bode(Ft,'b',FtAtv,'r',FtAtvK,'g')
figure(2)
step(FtAtvMfK)
% stepinfo(FtAtvMf)
stepinfo(FtAtvMfK)


figure(3)
margin(FtAtvK)
% figure(4)
% margin(FtAtvK)
%bode(Ft,'b',FtAt,'r')
%step(Ft,'b',FtAtMf,'r')
%stepinfo(Ft,FtAtMf)

% figure(1)
% bode(Ft,'b',Ft*5069,'r')

 
% 
%  TfMf = (FtAv*64.56);
%  TfMf2 = (TfMf)/(1+TfMf);
%  step(TfMf2)


