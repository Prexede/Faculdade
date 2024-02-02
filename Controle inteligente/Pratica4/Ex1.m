clear;
clc;
close all;
%% EX 1 Pratica 4

ErroN = [-100 -78 -56 -33 -11 11 33 56 78 100];
EuN = [1 1 0.93 0.56 0.19 0 0 0 0 0];
SuN = [1 0.76 0.33 0.08 0 0 0 0 0 0];

ErroZ = ErroN;
EuZ = [0 0 0.07 0.44 0.81 0.81 0.44 0.07 0 0];
SuZ = [0 0 0.01 0.25 0.86 0.86 0.25 0.01 0 0]; 

ErroP = ErroZ;
EuP = [0 0 0 0 0 0.19 0.56 0.93 1 1];
SuP = [0 0 0 0 0 0.01 0.08 0.33 0.76 1];

for i = 1:length(EuN)
    RN(i,:) = min(EuN(i),SuN); 
    RZ(i,:) = min(EuZ(i),SuZ);
    RP(i,:) = min(EuP(i),SuP);
end

%Erro 
x = 8;
    if(x ~= ErroN)
       index = ProxValue(x,ErroN);
       x = ErroN(index);
    end

vetN = ErroN == x;
vetZ = ErroZ == x;
vetP = ErroP == x;

multN = vetN*RN;
multZ = vetZ*RZ;
multP = vetP*RP;

Max = max(multN,multZ);
Max = max(Max,multP);

figure
plot(ErroN,Max)
title("Função de pertinência")
xlabel("Universo de discurso");
ylabel("µ(x)");
grid on

cda = CDA(ErroN,Max)
mdm = MDM(ErroN,Max)
mpm = MPM(ErroN,Max)
