gamma = ""
epsilon = ""
input = open("day3.txt").readlines()

for j in range(len(input[0])):
    ones = 0
    zeros = 0
    for i in range(len(input)):
        if (input[i][j:j+1]) == '0':
            zeros += 1
        elif (input[i][j:j+1]) == '1':
            ones += 1
    if zeros > ones:
        gamma += '0'
        epsilon += '1'
    elif ones > zeros:
        gamma += '1'
        epsilon += '0'

print (int(gamma, 2)*int(epsilon, 2))
