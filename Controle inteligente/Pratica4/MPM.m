function mpm = MPM(t,r)
    mpm = t(find(r == max(r),1));
end