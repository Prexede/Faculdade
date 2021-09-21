t = linspace(0,10,100);
m = 1;
L = 1;
g = 9.81;
s = poly(0,"s");
deno = m*(L^2)*((s^2)+(g/L));
nume = 1;
T = syslin('c',nume,deno);
y = csim('step',t,T);
figure(1)
//Alterando as propriedades do fundo do gráfico
f =get("current_figure");
f.background = -2;
xlabel('Tempo(s)', 'Fontsize',4)
ylabel('Deslocamento Angular[θ]','Fontsize',4)
title("Grafico Deslocamento X tempo(SCE)")
xgrid(1)
plot(t,y,'r');
