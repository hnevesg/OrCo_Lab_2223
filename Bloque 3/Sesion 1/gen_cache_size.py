import os

strides = (1, 4, 8, 16, 32, 64, 128, 256)

for i in strides:
	os.system("gcc -O0 -DSTRIDE={0} -o cache_size cache_size.c".format(i))
        os.system("perf stat -r 10 -e instructions:u,L1-dcache-loads-misses:u,L1-dcache-loads:u ./cache_size")

