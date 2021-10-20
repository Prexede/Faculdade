function [C2,R1,R] = Proj(a1,b1,Av,C1,Freq,tipo)
%   
%  
%
%   Sintaxe:
%
%   
%   
%   Exemplo:
%
%  
%   Observações:
% 
%
%   Dependências:
%
%  
%
%
%   Desenvolvida por: Carlos Eduardo Souza Silva e Allan Corço de Araujo
%   Data: 
%   Última modificação:  

switch tipo 
  
    case 'PB'
% sem simplificaçao 
    C2 = (C1*4*b1)/(a1^2);
    R1 = ((a1*C2) - sqrt(((a1^2)*(C2^2))-(4*b1*C1*C2)))/(4*pi*C1*C2*Freq);
    R2 = ((a1*C2) + sqrt(((a1^2)*(C2^2))-(4*b1*C1*C2)))/(4*pi*C1*C2*Freq);
    R = R2;
%com simplificação  C1 = C2, R1 = R2
    % R = (sqrt(b1)/(2*pi*Freq*C1));
    % R1 = R;R2 = R;
    % C2 = C1;

    case 'PA'
    C2 = C1;
    R1 = 1/(pi*Freq*C1*a1);
    R2 = a1/(4*pi*Freq*C1*b1);
    R = R2;
    
    case 'BB'
     C2 = 4*C1;
     R1 = ((a1*C2) + sqrt(((a1^2)*(C2^2))-(4*b1*C1*C2*(1-Av)))/(4*pi*C1*C2*Freq));
     R2 = R1;
     R3 = b1/(4*(pi^2)*(Freq^2)*C1*C2*R2);
     R = R3;
        
end 




syms s;
num = [1];
den = [0.618 1.3617 1];
Tf = tf(num,den);
%step(Tf);
%bode(Tf);
%A = 1 / (1 + a1*s + b1*(s^2));

