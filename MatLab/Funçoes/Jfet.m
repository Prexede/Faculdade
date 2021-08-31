function [Vgs,Id,Rd] = Jfet(Idss,Vp,Ro,Tipo)

%   Jfet Plota o grafico de corrente de dreno x Tensao porta fonte
%  
%
%   Sintaxe:
%
%   [Vgs,Id] = Jfet(Idss,Vp,Ro,Tipo)
%
%   Observações:
%
%   Utiliza a equação de Shockley 
%   Vgs = Tensao Gate x Source
%   Id = Corrente do dreno(Drain)
%   Idss = Corrente Dreno Source
%   Vp = Tensão de estrangulamento(Pinch off)
%   Tipo = Tipo do Transistor
%   Ro = Resistencia p/ Vgs = 0 
%   Rd = Res. p/ valores especificos de VGS
%
%   Dependências:
%
%   Limpar o Codigo 
%
%
%   Desenvolvida por: Carlos Eduardo Souza Silva.
%   Data: 16/08/2021
%   Última modificação:  16/08/2021

switch Tipo
    case 'N' 
       Vgs=linspace(Vp,0);
       Id = Idss*(( 1-(Vgs/Vp))).^2;
       Rd = Ro ./(( 1-(Vgs/Vp))).^2;
       subplot(2,2,1)
       plot(Vgs,Id,'b')
       ylim([0 0.008])
       xlabel('Vgs[V]','FontSize',14);
       ylabel('Id[Ma]','FontSize',14);
       grid on
       
       subplot(2,2,2)
       plot(Vgs,Rd,'r')
       xlabel('Rd[ohm]','FontSize',14);
       ylabel('Vgs[V]','FontSize',14);
       grid on

    case 'P'
       Vgs=linspace(0,Vp);
       Id = Idss*(( 1-(Vgs/Vp))).^2;
       Rd = (Ro./(1 - (Vgs/Vp).^2));
       subplot(1,2,1)
       plot(Vgs,Id,'b')
       xlabel('Vgs[V]','FontSize',14);
       ylabel('Id[Ma]','FontSize',14);
       grid on
       
       subplot(1,2,2)
       plot(Vgs,Rd,'r')
       xlabel('Rd[ohm]','FontSize',14);
       ylabel('Vgs[V]','FontSize',14);
       grid on
end
