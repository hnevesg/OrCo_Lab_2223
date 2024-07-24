all: array_O0.S array_O1.S array_O3

array_O0: array.c
	$(CC) -O0 -g -o array_O0 array.c

array_O1: array.c
	$(CC) -O1 -g -o array_O1 array.c

array_O3: array.c
	$(CC) -O3 -g -o array_O3 array.c

array_O0.S: array_O0
	objdump -S array_O0 > array_O0.S

array_O1.S: array_O1
	objdump -S array_O1 > array_O1.S

clean:
	$(RM) *~ array_O? *.S
