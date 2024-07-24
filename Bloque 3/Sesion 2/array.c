#include <stdlib.h>

long add_array(int* A, int size)
{
  unsigned i;
  long result;
  
  for (i = 0; i < size; i++)
      result += A[i];
  
  return result;
}


int main(int argc, char *argv[]) {
  volatile long result;
  unsigned size = atoi(argv[1]);
  unsigned it;
  
  int* A = (int*)malloc(size * sizeof(int));

  for (it = 0; it < 100; it++)  
    result = add_array(A, size);

  free(A);
}
