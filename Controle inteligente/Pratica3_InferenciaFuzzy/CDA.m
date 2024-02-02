function cda = CDA(t,r)
   num = 0;
   den = 0;
    for i = 1:length(r)
        
        num = num + (r(i)*t(i));
        den = den + r(i);
        
    end
    cda = num/den;
    
end