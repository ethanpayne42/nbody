import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.mplot3d import Axes3D

# Imports for plotting
import matplotlib as mpl
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

params = {
   'axes.labelsize': 18,
   'font.size': 24,
   'legend.fontsize': 18,
   'xtick.labelsize': 18,
   'ytick.labelsize': 18,
   'axes.titlesize':18,
   'text.usetex': True,
   'figure.figsize': [6, 6],
   'font.family':'sans',
   'font.serif':'DejaVu'
   }
mpl.rcParams.update(params)

results = np.genfromtxt('results.out')

xs = results[:,0]
ys = results[:,1]
zs = results[:,2]
ts = results[:,-1]

fig = plt.figure(figsize=[6,6])
ax = fig.add_subplot(111, projection='3d')

ax.scatter([0],[0],[0],color='k')

ax.plot(xs,ys,zs)
plt.axis('equal')

ax.set_xlabel(r'$x$')
ax.set_ylabel(r'$y$')
ax.set_zlabel(r'$z$')

plt.tight_layout()

plt.show()
