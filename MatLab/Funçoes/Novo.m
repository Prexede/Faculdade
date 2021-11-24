clear, clc,
%%obtenção dos dados
M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;
q = (M+m)*(I+m*l^2)-(m*l)^2;
%%
s = tf('s'); % configura o s para funcionar como uma FT
P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q); % define a FT malha fechada
figure(1)
rlocus(P_pend) % plota o lugar das raizes em malha fechada
title({'lugar das raizes em malha fechada'});
t=0:0.01:10;
figure(2)
impulse(P_pend,t)% plota a resposta da FT para um impulso
title({'Resposta sem controlador'});
%%
figure(3)%esse bloco define um controlador p paralelo. A logica dos seguintes blocos segue a mesma que a desse
Kp = 600;
Ki = 0;
Kd = 0;
C = pid(Kp,Ki,Kd);
T = feedback(P_pend,C);
t=0:0.01:10;
impulse(T,t)
title({'Resposta controlador p'});
%%
figure(4)
Kp = 100;
Ki = 10;
Kd = 0;
C = pid(Kp,Ki,Kd);
T = feedback(P_pend,C);
t=0:0.01:10;
impulse(T,t)
title({'Resposta controlador pi'});
%%
figure(5)
Kp = 10;
Ki = 0;
Kd = 100;
C = pid(Kp,Ki,Kd);
T = feedback(P_pend,C);
t=0:0.01:10;
impulse(T,t)
title({'Resposta controlador pd'});
%%
figure(6)
Kp = 100;
Ki = 100;
Kd = 100;
C = pid(Kp,Ki,Kd);
T = feedback(P_pend,C);
t=0:0.01:10;
impulse(T,t)
title({'Resposta controlador pid'});