M = 1.12;
m = 0.12;
b = 2.531;
I = 0.01233;
g = 9.81;
l = 0.146;
q = (M+m)*(I+m*l^2)-(m*l)^2;


s = poly(0,"s");
num4 = (m*l);
den4 = ((((-(m+M)*I)+(M*m*(l^2)))*s^2)+((m+M)*(m*g*l*s))); 
T4 = syslin('c',num4,den4);
θ4 = csim('step',t,T4);
//θg4=θ4*(180/%pi)
figure(3)
plot(t,θ4,'r');
