import os

optimization_level = (0, 1, 3)
sizes = (1000, 5000, 10000, 15000, 20000)

for i in optimization_level:
    for j in sizes:
        os.system("perf stat -r 10 -e instructions:u,L1-dcache-loads-misses:u,L1-dcache-loads:u ./array_O{0} {1}".format(i,j))

