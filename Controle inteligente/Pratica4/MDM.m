function [mdm,vk,M] = MDM(t,r)
    vk = 0;
    M = 0;
    for i = 1:length(t)
       if(r(i) == max(r))
          vk = t(i) + vk; 
          M = 1 + M;
       end
    end
    
    mdm = vk/M;
end