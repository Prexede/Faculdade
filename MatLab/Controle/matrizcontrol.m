function [valor1] = matrizcontrol(a1,a2,a3,a4)


%formato matriz
%Matrix = [ a1  a2
%           a3  a4]
% b1= coeficiente dividido pelo det
%


m = [a1 a2; a3 a4];
a=det(m);
valor1=(-a)/a3;
