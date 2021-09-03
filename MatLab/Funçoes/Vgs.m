function [Vgs] = Vgs(Idss,Vp,Rs)

syms x
eq = Idss + ((2*x*Rs*Idss)/Vp) + (((x^2)*(Rs*2)*Idss)/(Vp^2)) - x == 0;
Id=solve(eq, x);


Vgs = -Id * Rs;