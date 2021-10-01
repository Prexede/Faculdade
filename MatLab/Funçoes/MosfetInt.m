function [Id,Vds,Vgs,Zin,Zout,Av,Avt] = MosfetInt(k,Vt,Vd,Rg1,Rg2,Rd,Rs,Rf,Rl,Tipo)

%   Descobre o Id/Vgs de acordo com a polarização dele
%  
%
%   Sintaxe:
%
%   [Id,Vds] = MosfetInt(k,Vt,Vd,Rg1,Rg2,Rd,Rs,Tipo)
%
%   Observações:
%
%   
%   Esponja chatão 
%
%   Dependências:
%
%  
%
%
%   Desenvolvida por: Carlos Eduardo Souza Silva.
%   Data: 
%   Última modificação:  

syms x
switch Tipo
    case 'Div' 
    Vg = (Rg2*Vd)/(Rg1+Rg2);
    eq = (Rs*k)*(x^2) + (1 - (2*Rs*k*Vt))*x + (((Vt^2)*Rs*k)- Vg);
    Vgs = solve(eq,x);
    Id = (Vg - Vgs)/Rs;
    Vds = Vd - (Id*(Rs+Rd));
    Zin = ((Rg1*Rg2)/(Rg1+Rg2));
    Zout = Rd;
    Gm = 2*k*(Vgs-Vt);
    par = (Rd*Rl)/(Rd+Rl);
    %Av = (-Gm*(par))/(1 + (Gm*Rs));
    Av = (-Gm*Rd);
    Avt = Av*(Zin/Rf+Zin);
end