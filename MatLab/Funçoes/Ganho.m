function [Vgs,Id] = Ganho(RG1,RG2,Rs,Vd,Vp,k,Tipo)

%   Descobre o Id/Vgs de acordo com a polarização dele
%  
%
%   Sintaxe:
%
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
%   Desenvolvida por: Carlos Eduardo Souza Silva e Allan Corço de Araujo
%   Data: 
%   Última modificação:  
    syms x
    
switch Tipo
    case 'a'
        Vg = (Vd*RG2)/(RG1 + RG2);
        eq = ((Vg-x)/Rs)== k*((x-Vp)^2);   
        Vgs = solve(eq,x);
        Id = (Vg - Vgs)/Rs;
        
%     case 'Fc'
%         Zi = RG;
%         Zo = RD;
%         Av = ((-Gm)*(RD));
%         
%     case 'Fs'
%         Zi = RG;
%         Zo = RD;
%         Av = (-Gm*((RD*RL)/(RD + RL)))/(1 + Gm*RS);
%         Avt = Av*(Zi/(Rf+Zi));
end