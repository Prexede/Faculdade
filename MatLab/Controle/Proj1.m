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

%Numerador e Denominador da nossa Função de Transferencia
num = [40];
den = [1 40 0 0];

%Sobressinal
S = 15;

%Tempo de Assentamento
Ts = 2;

%Frequencia 
W = {0.001,1000};

[mag,phase,w] = bode(num,den,W);

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

     
%% Compensador por Avanço de Fase

%Frequencia MalhaFechada
Wmf=0.8*Wbw;  
[Mag,Fase] = bode(Ft,Wmf);

%Angulo maximo de compensação
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
CompAv=tf(gama*numAv,denAv);  

%% Compensador por Atraso de Fase

%Frequência da margem de fase desejada
m = 1;
L = -(270 - (mf + 8));
    while (phase(m) > L)
        m = m+1;
    end     
WbwAt = w(m-1);
WmfAt=0.8*WbwAt; 

y = mag(m-1);   %Não precisa de conversão

%Tat
Tat = 1/(0.1*WmfAt);

%Definição Compensador de Atraso de Fase
numAt=[Tat 1];                      
denAt=[y*Tat 1];
CompAt=tf(numAt,denAt);

%% Avanço e Atraso de fase

%Frequencia de Malha Fechada
Wmf=0.8*Wbw; 

%Angulo maximo de compensação
angmax = mf - (180 + Fase) + 8 ;%+8 Segurança
angmax = angmax*pi/180;

%Beta
beta=(1-sin(angmax))/(1+sin(angmax));  

%Gama
gama=1/beta;   

%Tav 
Tav=sqrt(beta)*Wmf;

%Tat
Tat=0.1*Wmf;

%Definição do compensador de avanço de fase
numGav = [1 Tav];
denGav = [1 gama*Tav];
Gav = tf(numGav,denGav);

%Definição do compensador de atraso de fase
numGat = [1 Tat];
denGat = [1 Tat/gama];
Gat = tf(numGat,denGat);

%% Funçoes

%Ft com Avanço de fase
FtAv = (Ft*CompAv);
%Ft com Avanço de fase e ajuste de ganho
FtAvK = (Ft*CompAv*5.62);

%Ft com Atraso de fase
FtAt = (Ft*CompAt);
%Ft com Atraso de fase e ajuste de ganho
FtAtK = (Ft*CompAt*27.227);

%Ft com Atraso e Avanço de fase
FtAtv = (Ft*Gat*Gav);
%Ft com Atraso e Avanço de fase e ajuste de ganho
FtAtvK = (Ft*Gat*Gav*109.64);

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
bode(FtAvK,'b',FtAtK,'r',FtAtvK,'g')
legend('Compensado Avanço','Compensado Atraso','Compensado Avanço e Atraso');

% figure(1)
% step(FtAvMfK,'b',FtAtMfK,'r',FtAtvMfK,'g')
% legend('Compensado Avanço','Compensado Atraso','Compensado Avanço e Atraso');

% figure(1)
% rlocus(FtAvMfK,'b',FtAtMfK,'r',FtAtvMfK,'g')
% legend('Compensado Avanço','Compensado Atraso','Compensado Avanço e Atraso');

%stepinfo(FtAtvMfK)
%stepinfo(FtAtvMfK)

%figure(1)
%margin(FtAtvK)
%bode(Ft,'b',FtAt,'r')
%step(Ft,'b',FtAtMf,'r')
%stepinfo(Ft,FtAtMf)

% figure(1)
% bode(Ft,'b',Ft*5069,'r')
% 
%  TfMf = (FtAv*64.56);
%  TfMf2 = (TfMf)/(1+TfMf);
%  step(TfMf2)


