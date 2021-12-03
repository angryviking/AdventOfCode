oxygen = open("day3.txt").readlines()
carbondioxide = open("day3.txt").readlines()
oxygen2 = []
carbondioxide2 = []

for j in range(len(oxygen[0])):
    if len(oxygen) == 1:
        break
    ones = 0
    zeros = 0
    for i in range(len(oxygen)):
        if (oxygen[i][j:j+1]) == '0':
            zeros += 1
        elif (oxygen[i][j:j+1]) == '1':
            ones += 1
    if zeros > ones:
        for x in range(len(oxygen)):
            if (oxygen[x][j:j+1]) == '0':
                oxygen2.append(oxygen[x])
    elif ones > zeros:
        for x in range(len(oxygen)):
            if (oxygen[x][j:j+1]) == '1':
                oxygen2.append(oxygen[x])
    elif zeros == ones:
        for x in range(len(oxygen)):
            if (oxygen[x][j:j+1]) == '1':
                oxygen2.append(oxygen[x])
    oxygen.clear()
    oxygen = oxygen2.copy()
    oxygen2.clear()

for j in range(len(carbondioxide[0])):
    if len(carbondioxide) == 1:
        break
    ones = 0
    zeros = 0
    for i in range(len(carbondioxide)):
        if (carbondioxide[i][j:j+1]) == '0':
            zeros += 1
        elif (carbondioxide[i][j:j+1]) == '1':
            ones += 1
    if zeros > ones:
        for x in range(len(carbondioxide)):
            if (carbondioxide[x][j:j+1]) == '1':
                carbondioxide2.append(carbondioxide[x])
    elif ones > zeros:
        for x in range(len(carbondioxide)):
            if (carbondioxide[x][j:j+1]) == '0':
                carbondioxide2.append(carbondioxide[x])
    elif zeros == ones:
        for x in range(len(carbondioxide)):
            if (carbondioxide[x][j:j+1]) == '0':
                carbondioxide2.append(carbondioxide[x])
    carbondioxide.clear()
    carbondioxide = carbondioxide2.copy()
    carbondioxide2.clear()

print (int(oxygen[0], 2)*int(carbondioxide[0], 2))
