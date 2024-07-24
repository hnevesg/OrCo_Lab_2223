#include "stdio.h"
//#define ROWS 1000
//#define COLS 1000

#define ITERATIONS 10

int A[ROWS][COLS];

int main() {
  int i, j, it;

  for (it = 0; it < ITERATIONS; it++)
    {
      for ( i = 1; i < ROWS; i++)      
	{
	  for (j = 1; j < COLS; j++)      	  
	    A[i][j]= A[i-1][j-1];
	}
    }

  return 0;
}
