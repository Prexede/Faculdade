function [Id,Vds,Vgs] = MosfetDeple(Idss,Vp,Rd,Rs,R1,R2,Vd,Tipo)

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
    case 'F' 
     eq = x == Idss * (1 - ((-x*(Rs))/Vp))^2;   
     Id = solve(eq,x);
     Vds = Vd - (Id*(Rd+Rs));
     
     
     case 'G'
     eq = x == Idss * (1 - ((-x*(Rd))/Vp))^2;   
     Id = solve(eq,x);
     Vgs = 4 - (Id*(Rs));
     Vds = -Id*(Rd+Rs) + 22;
      
    case 'Div'
        Vg = ((R2*Vd)/(R1+R2));
        eq = x == Idss * (1 - (Vg - (x*Rs))/Vp)^2;   
        Id = solve(eq,x);
        Vgs = Vg - (Id*Rs);
        Vds = Vd - (Id*(Rs+Rd));
        
end