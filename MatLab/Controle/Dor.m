function Dor
angmax = 26.1;
Wbw = 3.2;
Wmf=0.8*Wbw;
num = [20];
den = [1 3 2 0];
beta=(1-sin(angmax))/(1+sin(angmax));
gama=1/beta;
Tav=sqrt(beta)*Wmf;
Tat=0.1*Wmf;
numGav = [1 Tav];
denGav = [1 gama*Tav];
Gav = tf(numGav,denGav);
numGat = [1 Tat];
denGat = [1 Tat/gama];
Gat = tf(numGat,denGat);
Tf = tf(num,den);
G = (Tf*Gat*Gav);
margin(G)