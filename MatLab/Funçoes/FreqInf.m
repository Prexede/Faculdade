function [Domin,Ri,Ro,Req] = FreqInf(Rsig,Rg,Rd,Rs,Rl,gm,Cg,Cc,Cs)

%   Diz a Frequencia dominante inferior para o Transistor JFET
%  
%
%   Sintaxe:
%
%   [Domin,Ri,Ro,Req] = FreqInf(Rsig,Rg,Rd,Rs,Rl,gm,Cg,Cc,Cs)
%
%   Observações:
%
%   rd nao esta sendo considerado para as contas   
%
%   Dependências:
%
%  
%
%
%   Desenvolvida por: Carlos Eduardo Souza Silva.
%   Data: 08/09/2021
%   Última modificação:  08/09/2021

        
        
        %Ro = (Rd*rd)/(Rd+rd);
        Ro = Rd;
        FLc = 1/(2*pi*(Ro+Rl)*Cc);
        
        FLg = 1 /(2*pi*(Rsig+Rg)*Cg);
        Ri = Rg;

        Gm = 1/gm;
        Req = (Rs*Gm)/(Rs+Gm);
        FLs = 1/(2*pi*(Req)*Cs);
        
        if FLg > FLc && FLg > FLs
                disp('FLg');
                Domin = Flg;
                
        elseif FLc > FLs
                disp('FLc');
                Domin = FLc;
        else 
                disp('FLs');
                Domin = FLs;
            
        end







