function Proj1(num,den,S,Ts)
%%
%   Sintaxe:
%
%   
%
%   Observações:
%
%   
%   
%
%   Exemplo:
%
%   
%   Dependências:
%
%  
%
%
%   Desenvolvida por: Carlos Eduardo
%   Data: 
%   Última modificação:

%% Definiçao Variaveis 
n = 1000; 
theta = linspace(0, 2*pi, n);
x = cos(theta);
y = sin(theta);
zeta = sqrt((log(S/100)^2)/((pi^2)+(log(S/100)^2)));    %zeta por sobressinal 
mf = atan((2*zeta)/(sqrt((-2*zeta^2)+(sqrt(1+(4*zeta^4))))));  %margem de fase
mf = mf*180/pi;  %conversao rad/grau
Wbw = 4/(Ts*zeta);
Wbw = Wbw*sqrt((1-(2*zeta^2))+sqrt(4*zeta^4-(4*zeta^2)+2));


%% Avanço


%% Main
Ft = tf(num,den);

figure(1)
margin(Ft)
%step(num,[1 40 0 40])
%bode(Ft)

figure(2)
%margin(Ft*5069)
%step(num*5069,[1 40 0 40*5069])
%nyquist(Ft,'b-')
%hold on
%plot(x,y,'r'); 
