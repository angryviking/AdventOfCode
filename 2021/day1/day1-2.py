import numpy as np

increased = 0
depths = np.loadtxt("day1.txt", dtype=int)

for i in range(0, len(depths) - 3):
    if depths[i+3] > depths[i]: 
        increased += 1

print (increased)
