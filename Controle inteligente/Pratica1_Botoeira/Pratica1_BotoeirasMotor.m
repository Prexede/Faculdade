    %% Nomes
    % Carlos Eduardo 769877
    % Matheus Costa 769089
    % Allan Corço 769870
    % Gustavo Yudi 769911
    
    %% Pratica 1
    %%LED 0
    L0 = input("L0 esta ligado?");
    if L0 == 0
        V1 = input("V1 tem tensão?");
        if V1 == 0
            disp("Problema na rede");
        else
            V2 = input("V2 esta tensão");
            if V2 == 0
                disp("Problema no C1");
            else
                disp("Problema no F1");
            end
        end
    else
        L1 = input("L1 esta ligado ?");
        if L1 == 0
            V3 = input("V3 tem tensão?");
            if V3 == 0
                disp("Problema no RT");
            else
                V4 = input("V4 esta tensão");
                if V4 == 0
                    disp("Problema no B0");
                else
                    V5 = input("V5 tem tensão?");
                    if V5 == 0
                        disp("Problema no B1");
                    else
                        disp("Problema no K1");
                    end
                end
            end
        else
            V6 = input("V6 tem tensão?");  
            if V6 == 0
                disp("Problema no IF");
            else 
                M = input("Motor esta ligado?");
                if M == 0
                    disp("Problema no motor");
                end
            end
        end
    end

    