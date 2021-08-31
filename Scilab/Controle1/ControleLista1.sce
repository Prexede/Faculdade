//4.1 Vetores e matrizes

//a) Crie um vetor x com 5 n´umeros inteiros.
    x = [1 2 3 4 5];

//b) Crie uma matriz A de dimens˜ao 4 × 4 com n´umeros inteiros.
    A = [1 1 1 1 ; 2 2 2 2; 3 3 3 3; 4 4 4 4];

//c) Obtenha o vetor y transposto de x.
    y = x.';

//d) Obtenha a matriz B transposta de A.
    B = A.'

//e) Crie um vetor z com 5 elementos aleat´orios reais (Utilize a fun¸c˜ao rand).
    z = rand(5,1);

//f) Crie uma matriz C de dimens˜ao 4 × 4 com n´umeros reais n˜ao-inteiros maiores que 1.
    C = [1.1 : 1.2 : 5 ; 1.2 : 1.3 : 6; 1.3 : 1.4 : 6 ; 1.4 : 1.6 : 7];

//4.2 Formatos de apresenta¸c˜ao

//a) Apresente as vari´aveis x, A, z e C mostrando 5 d´ıgitos.
    format('v',7);x,A,z,C;

//b) Apresente as vari´aveis x, A, z e C mostrando 5 d´ıgitos no formato exponencial
    format('e',11);x,A,z,C;

//c) Apresente as vari´aveis x, A, z e C mostrando 15 d´ıgitos.
    format('v',17);x,A,z,C

//d) Apresente as vari´aveis x, A, z e C mostrando 15 d´ıgitos no formato exponencial.
    format('e',21);x,A,z,C

//e) Apresente as vari´aveis x, A, z e C no formato rat.
   // nao entendi )

//4.3 N´umeros complexos

//1. Crie um vetor com n´umeros complexos: k = [3 + 5i, 2 − 10j]
    k =[3+5*%i  2-10*%i]

//2. Crie uma matriz com n´umeros complexos: D = [3 + 5i, 2 − 10j; 7 − 13j, 1.7 − 4j]
    D = [3+5*%i  2-10*%i ; 7-13*%i 1.7 - 4*%i]

//3. Obtenha um vetor mod k com os m´odulos dos n´umeros complexos do vetor k.
    mod_k = abs(k)

//4. Obtenha um vetor ang k com os ˆangulos dos n´umeros complexos do vetor k
    ang_k = atan(imag(k), real(k))

//5. Obtenha uma matriz mod D com os m´odulos dos n´umeros complexos da matriz D
    mod_D = abs(D)

//6. Obtenha uma matriz ang D com os ˆangulos dos n´umeros complexos da matriz D
    ang_D = atan(imag(D), real(D))

//7. Obtenha a matriz E transposta de D.
    E = D.'

//8. Obtenha a matriz F conjugada transposta de D.
    F = D'

//4.4 Opera¸c˜oes com matrizes

//a) Obtenha a soma das matrizes A e C.
    A + C
/*
   2.1   3.3   4.5   5.7 
   3.2   4.5   5.8   7.1 
   4.3   5.7   7.1   8.5 
   5.4   7.    8.6   10.2
*/

//b) Obtenha a subtra¸c˜ao entre as matrizes A e C.
    A - C
/*
  -0.1  -1.3  -2.5  -3.7
   0.8  -0.5  -1.8  -3.1
   1.7   0.3  -1.1  -2.5
   2.6   1.   -0.6  -2.2
*/

//c) Obtenha a multiplica¸c˜ao matricial entre as matrizes A e C.
    A * C
/*
   5.    10.5   16.   21.5
   10.   21.    32.   43. 
   15.   31.5   48.   64.5
   20.   42.    64.   86. 
*/

//d) Obtenha a multiplica¸c˜ao elemento a elemento entre as matrizes A e C.
    A .* C
/*
   1.1   2.3   3.5    4.7 
   2.4   5.    7.6    10.2
   3.9   8.1   12.3   16.5
   5.6   12.   18.4   24.8
*/

//e) Obtenha a inversa da matriz A.
// A matriz escolhida para o experimento nao é inversivel ja que o determinante dela é = 0
// Mas o comando para a inversão de matrizes é:
    //inv(A)

//f) Obtenha a divis˜ao pela esquerda entre as matrizes A e C (A\C).
    A\C 
/*
   0.43   0.91   1.39   1.87
   0.     0.     0.     0.  
   0.     0.     0.     0.  
   0.     0.     0.     0. 
*/

//g) Obtenha a divis˜ao pela direita entre as matrizes A e C (A/C).
    A/C
/*
Operator / : Error -1 not yet managed.
   0.   0.   13.3  -11.7
   0.   0.   26.7  -23.3
   0.   0.   40.   -35. 
   0.   0.   53.3  -46.7
*/

//h) Obtenha a divis˜ao elemento a elemento entre as matrizes A e C.
    A.\C
/*
   1.1    2.3    3.5    4.7 
   0.6    1.25   1.9    2.55
   0.43   0.9    1.37   1.83
   0.35   0.75   1.15   1.55
*/

//i) Obtenha um vetor com a exponencial de cada elemento do vetor x (e^x).
    exp(x)
/*
   2.72   7.39   20.1   54.6   148.
*/

//j) Obtenha a exponencial da matriz A (e^A).
    exp(A)
/*
   2.72   2.72   2.72   2.72
   7.39   7.39   7.39   7.39
   20.1   20.1   20.1   20.1
   54.6   54.6   54.6   54.6
*/

//k) Obtenha a quarta potˆencia de cada elemento do vetor x.
    x^4
/*
   1.   16.   81.   256.   625.
*/

//l) Obtenha o quadrado da matriz A.
    A^2
/*
   10.   10.   10.   10.
   20.   20.   20.   20.
   30.   30.   30.   30.
   40.   40.   40.   40.
*/

//4.5 Vetores com espa¸camento controlado

//a) Obtenha um vetor t1 iniciando em 0 e terminando em 10 com espa¸camento de 1.
    t1 = [1 : 1 : 10]
/*
   1.   2.   3.   4.   5.   6.   7.   8.   9.   10.
*/

//b) Obtenha um vetor t2 iniciando em 0 e terminando em 10 com espa¸camento de 0.1.
    t2 = [1 : .1 : 10]

//c) Obtenha um vetor t3 iniciando em −10 e terminando em 10 com 5 elementos espacados linearmente. (Utilize a fun¸c˜ao linspace)
    t3 = linspace(-10,10,5)
/*
  -10.  -5.   0.   5.   10.
*/

//d) Obtenha um vetor t4 iniciando em 50 e terminando em 0 com espa¸camento de 10.
    t4 = [50 : -10 : 0]
/*
50.   40.   30.   20.   10.   0.
*/

//4.6 Manipula¸c˜ao de matrizes

//a) Obtenha a matriz A2 contendo os elementos das linhas 3 at´e 4 e das colunas 1 at´e 2da matriz A.
    A2 = A(3:4,1:2)
/*
   3.   3.
   4.   4.
*/
//b) Obtenha a matriz A3 acrescentando uma linha na matriz A contendo os quatro primeiros elementos do vetor x.

 A3 = [A;x(:,1:4)];

//4.7 Fun¸c˜oes

//a) Crie uma fun¸c˜ao que receba como entrada um vetor t e gere como sa´ıda um vetor pcom a seguinte rela¸c˜ao p = t 2 + sen(2t) + 50.
    function[p]=funcTeste(t)  
    
    p =t^2+sin(2*t)+50;
    
    end

//b) Obs.: Abra um novo Script e chame a fun¸c˜ao a partir do arquivo da pr´atica. Nomeie o arquivo .sci como funcTeste.
    [p1] = funcTeste(t1)
    [p2] = funcTeste(t2)

//4.8 Gr´aficos

//a) Gere um gr´afico contendo os dados de p1 como fun¸c˜ao de t1 obtidos na Se¸c˜ao 4.7 com marcadores * em vermelho em cada ponto.

    plot(p1,'r:*')

//b) Na mesma figura, sobreponha um gr´afico de linha verde cont´ınua contendo os dados de p2 como fun¸c˜ao de t2 obtidos na Se¸c˜ao 4.7.

    plot(p2,'g-.');

//c) Adicione um t´ıtulo para o gr´afico.
    title("Grafico das funçoes P(t)")

//d) Adicione nomes nos eixos x e y do gr´afico.
    xlabel("tempo[s]")
    ylabel("Tensão[V]")

//e) Adicione uma legenda no gr´afico identificando os dois grupos de dados ilustrados.
    legend("p1","p2")

//f) Coloque a grade no gr´afico.
    xgrid()




















