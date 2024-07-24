import os

rows = (1, 100, 1000, 5000, 10000)
cols = (1, 100, 200, 300, 500)

for i in rows:
    for j in cols:
        os.system("gcc -O0 -DROWS={0} -DCOLS={1} -o cache_row_major cache_row_major.c".format(i,j))
        os.system("perf stat -r 10 -e instructions:u,L1-dcache-loads-misses:u,L1-dcache-loads:u ./cache_row_major")

