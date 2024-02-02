%% Lendo dados 
%Degrau = xlsread('C:\Users\carlo\OneDrive\Documentos\GitHub\Faculdade\Red\Controle\Teste1.csv','B2:B20');
Tempo = 0:0.01:0.40;
plot(Tempo,FullBat.MA,'r');
hold on
%% Degrau esperado 
DegrauEsp = 30*ones(1,41); 
DegrauEsp = transpose(DegrauEsp);
plot(Tempo,DegrauEsp);

%% Identificação 
%Pelo metodo ident 
%% Transfer function(Continua)
%Precisão 95.91%
%Polos:2/Zeros:1
numC = [23.71 1067];
denC = [1 59.66 1123];
TFCont = tf(numC,denC);
TFCont = 30*TFCont;
step(TFCont);

%% Transfer function(Discreta)
%Precisão 95.09%
%Polos:2/Zeros:1 Ts:0.01(10ms)
numD = [0.1658 0];
denD = [1 -1.2 0.378];
TFDisc = tf(numD,denD,0.01);
TFDisc = TFDisc*30;
step(TFDisc);
%% PID Tuner (Continuo)
%Settling Time: 0.0812s
%Overshoot: 5.5% (1.06)
% 
% KpDis = 29.416141428213937;
% TiDis = 0.062473332566550;
% KiDis = 467.9;
% TdDis = 0.007117219764826;
% KdDis = 0.2086;

Kp = 1.849;
Ki = 543.8;


%% Resposta com controle 
Mf = TFCont*(pid(Kp,Ki,0,0.01));
step(feedback(Mf,1));





