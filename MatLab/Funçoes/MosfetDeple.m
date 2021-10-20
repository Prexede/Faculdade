function [Avt,Av,Zin,Zout,Vgs,Id,FIci,FIco,FIcs,FSci,FSco] = MosfetDeple(Idss,Vp,Rd,Rs,Rl,Rf,Rg1,Rg2,Vd,Ci,Co,Cs,Cgd,Cgs,Cds,Tipo)

%   
%  
%
%   Sintaxe:
%
%   [Avt,Av,Zin,Zout,Vgs,Id,FIci,FIco,FIcs,FSci,FSco] = MosfetDeple(Idss,Vp,Rd,Rs,Rl,Rf,Rg1,Rg2,Vd,Ci,Co,Cs,Cgd,Cgs,Cds,Tipo)
%   
%   Exemplo:
%
%   [Avt,Av,Zin,Zout,Vgs,Id,FIci,FIco,FIcs,FSci,FSco] = MosfetDeple(60E-3,-1.45,820,220,10000,1000,5.6E6,510000,24,220E-9,10E-6,560E-6,60E-12,0,0,'Div')
%   
%   Observações:
% 
%   Rf = Rsource 
%   Vd = Vcc
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

      
    case 'Div'
        Vg = ((Rg2*Vd)/(Rg1+Rg2));
        eq = x == Idss * (1 - (Vg - (x*Rs))/Vp)^2; 
        Id = vpasolve(eq,x);
        
        Vgs = Vg - (Id*Rs);
        Vds = Vd - (Id*(Rs+Rd));
        
    if  Vgs(1) > Vp
        Vgs = Vgs(1);
        
    else
        Vgs = Vgs(2);
    end
            
        
        Zin = ((Rg1*Rg2)/(Rg1+Rg2));
        Zout = Rd;
        Gm0 = (2*Idss)/(abs(Vp));
        Gm = Gm0 * ( 1 - (Vgs/Vp));
        par = (Rl*Rd)/(Rl+Rd);
        Av = (-Gm*par);
        %Av = (-Gm*(par))/(1 + (Gm*(Rs)));
        Avt = Av*(Zin/(Rf+Zin));
        
        FIci = (1/(2*pi*(Rf+(Zin))*Ci));    %Frequencia corte inferior capacitor de entrada
        FIco = (1/(2*pi*(Rd+Rl)*Co));       %Frequencia corte inferior capacitor de saida
        Req2 = (((1/Gm)*Rs)/((1/Gm)+Rs));
        FIcs = double(1/(2*pi*Req2*Cs));    %Frequencia corte inferior capacitor da fonte/Source
    
        Cot = (Cds+((1-(1/Av))*Cgd));
        Cit = (Cgs+((1-(Av))*Cgd));
    
        FSco = double(1/(2*pi*par*Cot));
        Req3 = ((Zin*Rf)/(Zin+Rf));
        FSci = double(1/(2*pi*Req3*Cit));
       
end