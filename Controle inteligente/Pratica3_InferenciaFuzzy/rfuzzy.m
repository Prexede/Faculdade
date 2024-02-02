function [x,y] = rfuzzy(T,Ta,Tb,Tc,Td,Te,P,Pa,Pb,Pc,Pd,Pe,valor)

%% Singleton
singA = singleton(T,Ta,valor);
singB = singleton(T,Tb,valor);
singC = singleton(T,Tc,valor);
singD = singleton(T,Td,valor);
singE = singleton(T,Te,valor);

%% Saidas
%Se Ta -> Pc
sA = saida(Pc,singA);
%Se Tb -> Pa
sB = saida(Pa,singB);
%Se Tc -> Pd
sC = saida(Pd,singC);
%Se Td -> Pe
sD = saida(Pe,singD);
%Se Te -> Pb
sE = saida(Pb,singE);

%% Regiao Fuzzy
y = max(sA,sB);
y = max(y,sC);
y = max(y,sD);
y = max(y,sE);

x = P;
end
