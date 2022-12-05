#include<stdio.h>

int main()
{
    //Declare as variaveis do programa
    //Entrada
    float ponta,foraponta,intermediario,final_semana = 0;
    
    //Saida
    float convencional,tarifa_branca;
    
    //Lembre-se de não alterar o conteudo dos printfs
    //Lembre-se de declarar as variáveis que estão sendo utilizadas nos printfs prontos e do scanf
    
	
	printf("Bem-Vindos ao Programa Avaliando o seu Perfil de Consumo \n");
	printf("------------------------------------------------------------\n");
	printf("Digite a quantidade media de  kwh consumida por dia no horario de ponta (kWh): \n");
	scanf("%f",&ponta);
	printf("Digite a quantidade media de  kwh consumida por dia no horario fora de ponta (kWh): \n");
	scanf("%f",&foraponta); 
	printf("Digite a quantidade media de  kwh consumida por dia no horario intermediario (kWh): \n");
	scanf("%f",&intermediario);
	printf("Digite a quantidade media de  kwh consumida por dia no final de semana (kWh): \n");
	scanf("%f",&final_semana);


	if(ponta < 0 || foraponta < 0 || intermediario < 0 || final_semana < 0){
		printf("Não digite valores negativos para o consumo! \n");	
	}
	
	else if (ponta == 0 && foraponta == 0 && intermediario == 0 && final_semana == 0){
		printf("Os quatro valores digitados para consumo sao nulos! Reinicie o programa com valores corretos \n");
	}


	// Tarifa convencional 
	convencional = (0.693*(22*(ponta+foraponta+intermediario))) + (0.693*(9*final_semana));
	
	// Tarifa branca 
	tarifa_branca = (((1.356*ponta*22)+(0.892*intermediario*22)+(0.587*foraponta*22))) + (1.356*final_semana*9);


    printf("O valor do gasto mensal utilizando a tarifa branca (31 dias):  %.3f \n",tarifa_branca);
    
	printf("O valor do gasto mensal utilizando a tarifa convencional (31 dias):  %.3f \n",convencional);
		
    printf("Para o seu perfil de consumo, solicite a tarifa branca para a sua concessionaria. \n");
    
    printf("Empate, analise por mais alguns meses antes de definir. \n");
    
	printf("Permaneca com a taxa convencional. \n");	
	   
	return 0;
}
