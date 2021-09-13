function [FHo,FHi,Rtho,Rth] = FreqSup(Rsig,Rg,Rd,Rl,Cwi,Cwo,Cds,Cgs,Av,Avt,Cgd)
%   FreqSup(Rsig,Rg,Rd,Rl,Cwi,Cwo,Cds,Cgs,Av,Cgd)
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
        Cmi = (1 - Avt)*Cgd;
        Ci = Cwi + Cgs + Cmi;
        Rth = (Rsig*Rg)/(Rsig+Rg);
        FHi = (1 / (2*pi*Rth*Ci));
        
        Cmo = (1 - (1/Av))*Cgd;
        Co = Cwo + Cds + Cmo;
        Rtho = (Rd*Rl)/(Rd+Rl);
        FHo = (1 / (2*pi*Rtho*Co));
      
        
        if FHi > FHo
                disp('FHi');
               % Domin = FHi;
                
        else
                disp('FHo');
                %Domin = FHo;
     
        end
