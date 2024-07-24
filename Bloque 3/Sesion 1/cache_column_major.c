#include "stdio.h"
//#define ROWS 1000
//#define COLS 1000

#define ITERATIONS 10

int A[ROWS][COLS];

int main() {
  int i, j, it;

  for (it = 0; it < ITERATIONS; it++)
    {
      for ( i = 1; i < COLS; i++)      
	{
	  for (j = 1; j < ROWS; j++)      	  
	    A[j][i]= A[j-1][i-1];
	}
    }

  return 0;
}
