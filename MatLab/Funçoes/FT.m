function [z,p,k,Ru] = FT(num,den)
%   
%  
%
%   Sintaxe:
%
%   [z,p,k] = FT(num,den) 
%   
%   Exemplo:
%
%   Defina o num e den antes
%   num = [x1 x2 x3]
%   den = [s1 s2 s3]
%   [z,p,k] = FT(num,den)
%
%   Observações:
% 
%
%   Dependências:
%
%   Plotar todos os graficos de entradas(e legendar a entradaa)
%   Ajustar se a entrada é instavel/estavel 
%   Só funciona ate a 5 ordem (tem q criar um for )
%
%   Desenvolvida por: Carlos Eduardo Souza Silva.
%   Data: 20/10/2020
%   Última modificação:  
Ru = [;];
i = 1;
L = length(den);
for m = 1:3
    for n = 1:2
        if i <= L
        Ru(n,m) = den(i);
        i = i+1;
        elseif i > L
        Ru(n,m) = 0;
        end
    end     
end
 syms x   

    for n = 1:2 

        Ru(3,n) = - (det([Ru(1,1) Ru(2,1); Ru(1,n+1) Ru(2,n+1)]))/ Ru(2,1);
        if Ru(3,n) == 0 
            Ru(3,n) = 0.000001;
        end

    end

for n = 1:2
     Ru(4,n) = - (det([Ru(2,1) Ru(3,1); Ru(2,n+1) Ru(3,n+1)]))/ Ru(3,1);
     if Ru(4,n) == 0 
        Ru(4,n) = 0.00001;
    end
end

for n = 1:2
     Ru(5,n) = - (det([Ru(3,1) Ru(4,1); Ru(3,n+1) Ru(4,n+1)]))/ Ru(4,1);
     if Ru(5,n) == 0 
        Ru(5,n) = 0.00001;
    end
end



Ft = tf(num,den);
[z,p,k] = tf2zp(num,den);

%for x = 1:3
%     if p(x) > 0
%         disp('Resposta Instavel');
%     elseif p(x) == 0 
%         disp('Resposta Marginalmente estável');
%     elseif p(x) < 0 
%         disp('Resposta Assintoticamente estável');        
%     end
% end

%step(Ft,1);   %Plota entrada degrau
%impulse(Ft);   %Plota entrada impulso 
      
