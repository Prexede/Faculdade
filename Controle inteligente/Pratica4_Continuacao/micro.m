%% DENTRO DO MICRO 
t_entrada = 820;
p_entrada = 4.3;
QtdT = 40;
QtdP = 80;

    M = criaM(QtdT,QtdP);

    %Temperatura 
    it = ((QtdT - 1)*(t_entrada - 800)/(400)) + 1;
    it = round(it)
    %Pressão
    ip = ((QtdP - 1)*(p_entrada - 4)/(8)) + 1;
    ip = round(ip)

vazao = M(it,ip);