function [x,y] = vetTrapez(vi,vf,t1,t2,t3,t4,n)
%   Sintaxe:
%   
%   [x,y] = vetTrapez(vi,vf,t1,t2,t3,t4,n)
%
%   Observações:
%
%   Retorna os valores x e y de um grafico com resposta triangular 
%
%   vi = Valor Inicial
%   vf = Valor final
%   t1 = tempo inicial
%   t2 = tempo de pico
%   t3 = tempo de pico
%   t4 = tempo final
%   n = numero de pontos do intervalo
%
%   Desenvolvida por: Carlos Eduardo/Allan Corço/Gustavo Yudi
%   Data: 10/10/2023

j=1; 
inci=(vf-vi)/(n-1); %definicao do incremento
    for i=vi:inci:vf
        x(j)=i; %definicao do x
        %condicoes do y
        if x(j)<t1 || x(j)>t4
            y(j)=0;
        elseif t2>= x(j) 
            if t1 == t2
                y(j)= 1;
            else
                y(j)=(x(j)-t1)/(t2-t1);
            end
        elseif t3>x(j)
            y(j)=1;
        elseif t4>= x(j)
            y(j)=(t4-x(j))/(t4-t3);     
        end
        j = j+1;
   
    end
%% Plot
% figure(1) 
% plot(x, y)
% title("Função de pertinência trapezoidal")
% xlabel('x')
% ylim([0 1.1]);
% ylabel('Grau de Pertinencia')

end
