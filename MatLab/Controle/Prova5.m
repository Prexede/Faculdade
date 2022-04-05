function Prova5

num = [1 0.8];
den = [1 14 49 0];

Tf = tf(num,den);
bode(Tf);

Wmf = 11.4;
Wc = Wmf*0.01;

N = abs((j*Wmf)+Wc);
D = abs(j*Wmf);
M = 45;

K = ((10^(M/20))*(N/D));
numPi = K*[1 Wc];
denPi = [1 0];
Gpi = tf(numPi,denPi);

TfPi = series(Gpi,Tf);
bode(TfPi)

%-(180 - 122 + 5)+ mf
Pc = -8 ;       %120   -13

Kd = tand(Pc)/Wmf;

numPd = Kd*[1 1/Kd];
denPd = [1];
Gpd = tf(numPd,denPd);

TfTf = Gpd*TfPi;
bode(TfTf)