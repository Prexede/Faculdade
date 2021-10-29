
M = 1.12;
m = 0.12;
b = 2.531;
I = 0.01233;
g = 9.81;
l = 0.146;
q = (M+m)*(I+m*l^2)-(m*l)^2;

s = poly(0,"s");
den = (s^3 + (((b*(I + m*l^2))*s^2)/q) - ((((M + m)*m*g*l)*s)/q) - ((b*m*g*l)/q)); 
num = (m*l*s/q);
T = syslin('c',num,den);
t = linspace(0,0.5,50);
θ = csim('step',t,T);
//θg=θ*(180/%pi)
figure(0)
//plot(t,θ,'r');

num1 = m*l;
den1 = (-(m+M)*((I+m*l^2)*s^2)+((m^2)*(l^2)*s^2));
T1 = syslin('c',num1,den1);
θ1 = csim('step',t,T1);
figure(1)
//plot(t,θ1,'r');

num2 =-1;
den2 = (m*l*s^2)-((m+M)*g);
T2 = syslin('c',num2,den2);
θ2 = csim('step',t,T2);
figure(2)
//plot(t,θ2,'r');

num3 = (-0.9649);
den3 = (s^2)-(11.74*s)-0.9649;
T3 = syslin('c',num3,den3);
θ3 = csim('step',t,T3);
figure(2)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
plot(t,θ3,'r');

s = poly(0,"s");
num4 = (m*l);
den4 = ((((-(m+M)*I)+(M*m*(l^2)))*s^2)+((m+M)*(m*g*l*s))); 
T4 = syslin('c',num4,den4);
θ4 = csim('step',t,T4);
//θg4=θ4*(180/%pi)
figure(3)
//plot(t,θ4,'r');
