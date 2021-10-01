function [Avt,Av,Zin,Zout,Vgs,Id] = MosfetDeple(Idss,Vp,Rd,Rs,Rl,Rf,Rg1,Rg2,Vd,Tipo)

%   Descobre o Id/Vgs de acordo com a polarização dele
%  
%
%   Sintaxe:
%
%   [Id,Vds,Vgs] = MosfetDeple(Idss,Vp,Rd,Rs,R1,R2,Vd,Tipo)
%
%
%   Observações:
%
%   

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
        Vg = ((Rg2*Vd)/(Rg1+Rg2));
        eq = x == Idss * (1 - (Vg - (x*Rs))/Vp)^2;   
        Id = solve(eq,x);
        Vgs = Vg - (Id*Rs);
        Vds = Vd - (Id*(Rs+Rd));
        
        
        Zin = ((Rg1*Rg2)/(Rg1+Rg2));
        Zout = Rd;
        Gm0 = (2*Idss)/(abs(Vp));
        Gm = Gm0 * ( 1 - (Vgs/Vp));
        par = (Rl*Rd)/(Rl+Rd);
        Av = (-Gm*Rd);
        %Av = (-Gm*(par))/(1 + (Gm*(Rs)));
        Avt = Av*(Zin/(Rf+Zin));
       
end