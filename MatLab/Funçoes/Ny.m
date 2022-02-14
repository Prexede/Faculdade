
function Ny(num,den)

%%   Sintaxe:
%
%   Ny(num,dem)
%   Ny([x0],[x1 x2 x3 x4])
%   
%%   Exemplo:
%
%   num = [7];
%   den = [1 -8];
%   Ny(num,den) 
%
%%   Observações:
% 
%   num = numerador
%   den = denominador
%
%%
%   Desenvolvida por: Carlos Eduardo
%   Data: 10/02/2022
%   Última modificação:  

%%
n = 1000; 
theta = linspace(0, 2*pi, n);
x = cos(theta);
y = sin(theta);
H = tf(num,den);

nyquist(H); 
hold on;
plot(x,y,'r'); 