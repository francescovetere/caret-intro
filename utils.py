import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d

def read_predY(filename):
    z = []

    with open(filename) as file:
        for line in file:
            z.append(float(line[4:].strip()))
    return z

def read_realY(filename):
    z = []

    with open(filename) as file:
        z = []
        content = file.read()
        listOfInt = content.split()
        for i in listOfInt:
            z.append(float(i))
        return z

def read_realX(filename):
    z = []

    with open(filename) as file:
        for line in file:
            z.append(float(line[4:].strip()))
    return z

def plot(x, y, z):
    # x, y = np.meshgrid(x, y)
    print(len(x), len(y), len(z), sep=" ")
    ax = plt.axes(projection="3d")

    ax.plot_trisurf(x, y, z, cmap="viridis", edgecolor="none")
    plt.show()

### PLOT REAL FUNCTION ###
# xmin, xmax, = -1, 1
# ymin, ymax, = -1, 1
# step = 0.001
# x = np.arange(xmin, xmax, step)
# y = np.arange(ymin, ymax, step)
# x, y = np.meshgrid(x, y)
# f = np.sin(np.pi * (x ** 2 + y ** 2))
# plot(x, y, f)