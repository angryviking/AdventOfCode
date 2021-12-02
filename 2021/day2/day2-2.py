import numpy as np

horizontal=0
depth=0
aim=0
directions = np.loadtxt("day2.txt", usecols=0, dtype=str)
positions = np.loadtxt("day2.txt", usecols=1, dtype=int)

for i in range(0, len(directions)):
    if directions[i] == 'forward':
        horizontal=horizontal+positions[i]
        depth=aim*positions[i]+depth
    elif directions[i] == 'down':
        aim=aim+positions[i]
    elif directions[i] == 'up':
        aim=aim-positions[i] 

print (horizontal*depth)