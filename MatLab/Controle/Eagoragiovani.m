function Eagoragiovani

% num = [5];
% den = [0.25 1.25 1 0];
% mf = 45;
% Fase = 180;

% num = [5];
% den = [0.4 1.4 1 0];
% mf = 30;
% Fase = 171;

num = [40];
den = [1 40 0 0];
mf = 53.69;


Tf = tf(num,den);
W = {0.001,1000};
[mag,phase,w] = bode(num,den,W);

% n= 1;
%  while (20*log(mag(n))>=-3)         %EPIFANIA, OLHA O GRAAFICO
%     n = n + 1;
%  end
% Wbw = w(n);

m = 1;
L = -(270 - (mf + 8));
    while (phase(m) > L)
        m = m+1;
    end    
Wbw = w(m-1);
%% Metodo 1
% y = 10^(mag(n)/20);
y = mag(m-1);

Wmf=0.8*Wbw; 
Tat = 1/(0.1*Wmf);
numAt=[Tat 1];                      
denAt=[y*Tat 1];
CompAt=tf(numAt,denAt);
FtAt = (Tf*CompAt*27.227);
figure(1)
margin(FtAt)

Ff = (FtAt/(1+FtAt));
figure(2)
step(Ff)
stepinfo(Ff);
%% Metodo 2 
% angmax = mf - (180 + Fase)+ 8 ;
% angmax = angmax*pi/180;
% beta=(1-sin(angmax))/(1+sin(angmax));  
% gama=1/beta;   
% Wmf=0.8*Wbw; 
% Tat=0.1*Wmf;
% numAt=[1 Tat];                      
% denAt=[1 Tat/gama];
% CompAt=tf(beta*numAt,denAt)
% FtAt = (Tf*CompAt);
% margin(FtAt)