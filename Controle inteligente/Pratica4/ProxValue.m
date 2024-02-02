function [index] = ProxValue(valor,vetor)
    
    for i = 1:length(vetor)
       prox(i) = abs(valor - vetor(i));
        
    end
    [P,index] = min(prox);
end