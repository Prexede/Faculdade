close all
clear
%% Função Temperatura

% Função Trapezoidal Muito Baixa
n = 500;

[T,Ta] = vetTrapez(0,50,0,0,5,15,n);

% Função triangular Baixa
[T,Tb] = vetTriang(0,50,5,15,25,n);

% Função triangular Media
[T,Tc] = vetTriang(0,50,15,25,35,n);

% Função triangular Alta
[T,Td] = vetTriang(0,50,25,35,45,n);

% Função Trapezoidal Muito Alta
[T,Te] = vetTrapez(0,50,35,45,50,50,n);

%% Plot Triangular 
figure
plot(T,Ta,T,Tb,T,Tc,T,Td,T,Te)
title("Função Pertinencia de temperatura")
xlabel("x(Temperatura)");
ylabel("µ(x)");
legend('Ta[Muito Baixa]','Tb[Baixa]','Tc[Media]','Td[Alta]','Te[Muito Alta]');
grid on

%% Função Pressão
% Função Trapezoidal Muito Baixa
[P,Pa] = vetTrapez(0,10,0,0,1,3,n);

% Função triangular Baixa
[P,Pb] = vetTriang(0,10,1,3,5,n);

% Função triangular Media
[P,Pc] = vetTriang(0,10,3,5,7,n);

% Função triangular Alta
[P,Pd] = vetTriang(0,10,5,7,9,n);

% Função Trapezoidal Muito Alta
[P,Pe] = vetTrapez(0,10,7,9,10,10,n);

%% Plot Pressao
figure
plot(P,Pa,P,Pb,P,Pc,P,Pd,P,Pe)
title("Função de pertinência de Pressão")
xlabel("x(Pressão)");
ylabel("µ(x)");
legend('Pa[Muito Baixa]','Pb[Baixa]','Pc[Media]','Pd[Alta]','Pe[Muito Alta]');
grid on

%% rFuzzy 
%CDA 13.3
[t,r] = rfuzzy(T,Ta,Tb,Tc,Td,Te,P,Pa,Pb,Pc,Pd,Pe,13.3);
cda13 = CDA(t,r);

figure
plot(t,r)

[t,r] = rfuzzy(T,Ta,Tb,Tc,Td,Te,P,Pa,Pb,Pc,Pd,Pe,18.8);
cda18 = CDA(t,r);

[t,r] = rfuzzy(T,Ta,Tb,Tc,Td,Te,P,Pa,Pb,Pc,Pd,Pe,30);
cda30 = CDA(t,r);

[t,r] = rfuzzy(T,Ta,Tb,Tc,Td,Te,P,Pa,Pb,Pc,Pd,Pe,42.3);
cda42 = CDA(t,r);

