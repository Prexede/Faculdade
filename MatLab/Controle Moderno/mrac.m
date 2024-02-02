%% Problema 1

am = 10; bm = 1;

t = linspace(0,10,100);

r = 5*cos(t) + 2*sin(pi*t);
a_est = ones(length(t),1);

b_est = ones(length(t),1);
teta_att = 0.1;
X_real = zeros(length(t),1);
X_model = zeros(length(t),1);
x0 = 0;
xm0 = 0;
e = zeros(length(t),1);
for i = 1:length(t)
    
    l(i) = bm/b_est(i);
    k(i) = (am + a_est(i))/b_est(i);
    
    u(i) = -k(i)*X_real(i) + l(i)*r(i);
    X_real(i) = a_est(i)*x0 + b_est(i)*u(i);
    X_model(i) = am*xm0 + bm*u(i);
    x0 = X_real(i);
    xm0 = X_model(i);
    %e(i) = x0 - xm0;
    e(i) = X_real(i) - X_model(i);
   
    a_est(i+1) = a_est(i) + 0.1;
    %b_est(i+1) = b_est(i) + 1;
end