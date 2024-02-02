function [x,y] = vetTriang(vi,vf,t1,t2,t3,n)
%   Sintaxe:
%   
%   [x,y] = vetTriang(vi,vf,t1,t2,t3,n)
%
%   Observações:
%
%   Retorna os valores x e y de um grafico com resposta triangular 
%
%   vi = Valor Inicial
%   vf = Valor final
%   t1 = tempo inicial
%   t2 = tempo de pico
%   t3 = tempo final 
%   n = numero de pontos do intervalo
%
%   Desenvolvida por: Carlos Eduardo/Allan Corço/Gustavo Yudi
%   Data: 10/10/2023

j=1; 
inci=(vf-vi)/(n-1); %definicao do incremento
    for i=vi:inci:vf
        x(j)=i; %definicao do x
        %condicoes do y
        if x(j)<= t1 || x(j)>=t3
            y(j)=0;
        elseif t2>= x(j) 
            y(j)=(x(j)-t1)/(t2-t1);
        elseif t3>x(j)
            y(j)=(t3-x(j))/(t3-t2);
            
        end
        j = j+1;
   
    end
%% plot
% figure(1) 
% plot(x, y)
% title("Função de pertinência triangular")
% xlabel('x')
% ylabel('Grau de Pertinencia')
    
end


