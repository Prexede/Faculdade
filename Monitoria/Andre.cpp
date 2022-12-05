#include <stdio.h>
#include <stdlib.h>


int Print(int TamCol,int TamL,int C[2][2])
{
	
	for(int row =0; row < TamL; row++)
	{
		for(int col =0; col<TamCol; col++)
		{
			printf("%d ",C[row][col],row,col);
		}
		printf("\n");
	}	
}




int MultMatriz(int TamCol,int TamL,int A[2][2], int B[2][2],int repeticoes)
{		
	int Somatorio = 0;
	
	for(int rep = 0; rep < repeticoes; rep++)
	{
		
	int C[2][2] = {{0 , 0},
					{0 , 0} };

						   		
		for (int row = 0; row < TamL; row++)
		{
	        for (int col = 0; col < TamCol; col++)
			{
	            for (int inner = 0; inner < 2; inner++)
				{
	                C[row][col] += A[row][inner] * B[inner][col];
	                
	            }
	            Somatorio += C[row][col];
	        }
	    }
	//Print(TamCol,TamL,C);
	}
			
	return (Somatorio/117);
}

int main() {
	
	// Variaveis Auxiliares
	int a,a1,b,b1,c,i,j;
	int aux = 0;
	int TamL = 2;
	int TamCol = 2;
	
	int repeticoes = 50;
	
	
	int A[2][2] = { {1, 3},
					{2, 5} };
	
	int B[2][2] = { {1, 3},
					{3,  -2} };
	
	//int A[i][j] = { {17, 24, 1,  8,  15},
	//				{23, 5,  7,  14, 16},
	//				{4,  6,  13, 20, 22},
	//				{10, 12, 19, 21, 3},
	//				{11, 18, 25, 2,  9} };
					
	//int B[i][j] = { {1,   3, -3, -1,  1},
	//				{3,  -2, -1,  1,  1},
	//				{-2, -1,  0,  2,  3},
	//				{0,   0,  2,  2, -2},
	//				{0,   2,  3, -2, -1} };		
	

										
	int r = MultMatriz(TamCol,TamL,A,B,repeticoes);
		
	printf("\n %d",r);

	return 0;
}




