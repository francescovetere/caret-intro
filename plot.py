import matplotlib.pyplot as plt
import numpy as np

import utils

predY = utils.read_predY("./predY.txt")
# print(predY)

realY = utils.read_realY("./realY.txt")
# print(realY)

realX = utils.read_realX("./realX.txt")

# print(len(predY))

# print(len(realY))

# print(len(realX))

data1 = list(zip(realX, realY))
data2 = list(zip(realX, predY))

x1 = [elem[0] for elem in data1]
y1 = [elem[1] for elem in data1]

x2 = [elem[0] for elem in data2]
y2 = [elem[1] for elem in data2]

plt.xlabel('instance')
plt.ylabel('predY')

# l1, = plt.plot(x1, y1, 'b-', label='realY')
l2, = plt.plot(x2, y2, 'r-', label='predY')
# plt.legend(handles=[l1, l2])

plt.show()
