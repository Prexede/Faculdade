function [s] = singleton(x,y,a)
    s = y(find(abs(x-a) < max(x)/(length(x)-1)/2));
   
end