function [Id,Vgs] = Vgs(Idss,Vp,Rs,Vgg,Tipo)

%   Descobre o Vgs/Id de acordo com a polarização dele
%  
%
%   Sintaxe:
%
%   [Id,Vgs] = Vgs(Idss,Vp,Rs,Vgg,Tipo)
%
%   Observações:
%
%   Utiliza a equação de Shockley 

%
%   Dependências:
%
%   Polarização em divisor de tensão ainda nao esta recebendo valores;
%
%
%   Desenvolvida por: Carlos Eduardo Souza Silva.
%   Data: /2021
%   Última modificação:  03/09/2021

syms x
eq = Idss + ((2*x*Rs*Idss)/Vp) + (((x^2)*(Rs*2)*Idss)/(Vp^2)) - x == 0;
Id=solve(eq, x);

switch Tipo
    case 'F' 
     Id = Idss * (1 + (Vgg/Vp))^2;   
     Vgs = -Vgg;
     
    case 'A'
      eq = Idss + (2*x*Rs*Idss)/Vp + (((x*Rs)^2)*Idss)/(Vp^2) == x;
      Id = solve(eq,x);
      Vgs = -Rs*Id;
      
    case 'D'
       Vg = (R2*Vdd)/(R1+R2);
       eq = Idss*(1-(2*(Vg-(x*Rs)))/Vp + ((Vg^2) - (2*Vg*x*Rs) + ((x^2)+(Rs^2)))/Vp^2) == x;
       Id = solve(eq,x);
       Vgs = Vg - Id*Rs;
end