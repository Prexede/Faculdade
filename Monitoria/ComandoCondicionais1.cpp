#include<stdio.h>

int main()
{   //Declare as variávies
	int X,Y;


	printf("Digite a coordenada (x,y) do plano cartesiano\n");
	scanf("%d %d",&X,&Y);
	
	if(X == 0 && Y == 0)
		printf("O ponto esta  na origem (0,0). \n");
	
	else if( Y == 0 ){
		printf("O ponto está sobre o eixo x. \n");
	}
	
	else if( X == 0 ){
		printf("O ponto está sobre o eixo y. \n");
	}	
	
	else if( X > 0 ){
		if(Y >= 0){
		printf("O ponto esta no quadrante 1. \n");	
		}	
		else{
		printf("O ponto esta no quadrante 4. \n");	
		}
	}
	
	else if( X < 0 ){
		if(Y >= 0){
		printf("O ponto esta no quadrante 2. \n");	
		}	
		else{
		printf("O ponto esta no quadrante 3. \n");	
		}
	}

	
    return 0;	
}
