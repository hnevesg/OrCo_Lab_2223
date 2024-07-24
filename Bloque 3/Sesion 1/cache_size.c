#define BUFFER_SIZE 65536
//#define STRIDE 1
#define ITERATIONS 10

volatile unsigned char A[BUFFER_SIZE];
//volatile dummy;

int main()
{
  int it, i;
  
  for (it = 0; it < ITERATIONS; it++)
    for (i = 0; i < BUFFER_SIZE; i += STRIDE)
      A[i]++;

  return 0;
}
	 
