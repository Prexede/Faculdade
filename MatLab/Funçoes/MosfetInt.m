function [Id,Vds,Vgs,Zin,Zout,Av,Avt,FIci,FIco,FIcs,FSci,FSco] = MosfetInt(k,Vt,Vd,Rg1,Rg2,Rd,Rs,Rf,Rl,Ci,Co,Cs,Cgd,Cgs,Cds,Tipo)

%   
%  
%
%   Sintaxe:
%
%   [Id,Vds,Vgs,Zin,Zout,Av,Avt,FIci,FIco,FIcs,FSci,FSco] = MosfetInt(k,Vt,Vd,Rg1,Rg2,Rd,Rs,Rf,Rl,Ci,Co,Cs,Cgd,Cgs,Cds,Tipo)
%
%   Observações:
%   Rf = Rsource 
%   Vd = Vcc
%   Esponja chatão 
%
%   Exemplo:
%
%   
%  [Id,Vds,Vgs,Zin,Zout,Av,Avt,FIci,FIco,FIcs,FSci,FSco] = MosfetInt(4.5,3,25,5.6E6,1.1E6,250,20,600,4700,100E-9,47E-6,6800E-6,60E-12,20E-12,0,'Div')
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
    Vg = (Rg2*Vd)/(Rg1+Rg2);
    eq = (Rs*k)*(x^2) + (1 - (2*Rs*k*Vt))*x + (((Vt^2)*Rs*k)- Vg);
    Vgs = vpasolve(eq,x);
  
    
    if  Vgs(1) > Vt
        Vgs = Vgs(1);
        
    else
        Vgs = Vgs(2);
    end
    
    Id = (Vg - Vgs)/Rs;
    Vds = Vd - (Id*(Rs+Rd));
    Zin = ((Rg1*Rg2)/(Rg1+Rg2));
    Zout = Rd;
 
    Gm = 2*k*(Vgs-Vt);
    par = (Rd*Rl)/(Rd+Rl);
    %Av = (-Gm*(par))/(1 + (Gm*Rs));
    Av = (-Gm*par);
    Avt = Av*(Zin/Rf+Zin);
    
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