function [M] = criaM(x,y)

    tp = linspace(800,1200,x);
    pp = linspace(4,12,y);
    Mfis = readfis("C:\Users\carlo\OneDrive\Documentos\GitHub\Faculdade\Controle inteligente\Pratica4_Continuacao\SuperficieFuzzy");
    
    for i=1:x
       
        for j=1:y
            
            M(i,j) = evalfis(Mfis,[tp(i) pp(j)]);
            
        end
        
    end
    
end