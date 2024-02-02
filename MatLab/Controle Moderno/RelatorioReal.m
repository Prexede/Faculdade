%% Experiencia 7 

% Parametros
am = 10;
bm = 1;
dt = 0.01;
t = 0:dt:10;
r = 5*cos(t) + 2*sin(pi*t);

Ft = tf([bm],[1 am]);
xm = lsim(Ft,r,t);

x = zeros(length(xm),1);

g1 = 2;
g2 = 2;
a = 0;
b = 1;
e(1) = 0;
%% 
for i = 1:length(t)
    e(i) = x(i) - xm(i);
    Llinha(i) = -g2*e(i)*r(i)*sign(b);
    Klinha(i) = g1*e(i)*x(i)*sign(b);  
    u(i) = -Klinha(i)*x(i) + Llinha(i)*r(i);
    b = bm/Llinha(i);
    a = Klinha(i)*b - am;
    x(i) = (bm*r(i) - b*u(i))/ ( a + am);
end
