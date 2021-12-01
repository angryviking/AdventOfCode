import numpy as np

increased = 0
depths = np.loadtxt("day1.txt", dtype=int)

for i in range(0, len(depths) - 1, 1):
    if (depths[i+1] > depths[i]):
        increased += 1

print (increased)
