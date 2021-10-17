Tensao = malhafechada.values;
t = malhafechada.time;
tau = 0.632*Tensao(900);
indice = find(Tensao > tau,1);
tau = t(indice);
plot(t,Tensao);
