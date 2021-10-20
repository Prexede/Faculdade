function [Gm,Gm0,Av,Avt,Zo,Zi] = Model(Idss,Vp,Vgs,RD,RS,RG,RL,Rf,Tipo)

%   Descobre o Id/Vgs de acordo com a polarização dele
%  
%
%   Sintaxe:
%
%   [Id,Vgs] = Vgs(Idss,Vp,Rs,Vgg,Tipo)
%
%   Observações:
%
%   Utiliza a equação de Shockley 
%   Use 3 casas no VGS 
%
%   Dependências:
%
%   Polarização em divisor de tensão ainda nao esta recebendo valores;
%
%
%   Desenvolvida por: Carlos Eduardo Souza Silva e Allan Corço de Araujo
%   Data: 03/09/2021
%   Última modificação:  03/09/2021

    Gm0 = (2*Idss)/(abs(Vp));
    Gm = Gm0 * ( 1 - (Vgs/Vp));
    
switch Tipo
    
    case 'Fc'
        Zi = RG;
        Zo = RD;
        Av = ((-Gm)*(RD));
        
    case 'Fs'
        Zi = RG;
        Zo = RD;
        Av = (-Gm*((RD*RL)/(RD + RL)))/(1 + Gm*RS);
        Avt = Av*(Zi/(Rf+Zi));
        
    case 'D'
        Zi = RG;
        Res = 1/Gm;
        Zo =(RS*Res)/(RS+Res);
        Av =(Gm*RS)/(1 + (Gm*RS));
        
    case 'Pc'
        Res = 1/Gm;
        Zi =(RS*Res)/(RS+Res);
        Zo = RD;
        Par = ((RD*RL)/(RD+RL));
        Av = Gm*Par;
        Avt = Av*(Zi/(Rf+Zi)); %RG = R3
end