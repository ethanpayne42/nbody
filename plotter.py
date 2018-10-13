import matplotlib.pyplot as plt
import numpy as np

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

#e = 0.0
#dt = 0.01

f = plt.figure(figsize=[6,6])

plt.plot(xs,ys)
plt.scatter([0],[0],color='k')
plt.xlabel(r'$x$')
plt.ylabel(r'$y$')

val = 2.0
step = np.round(val/4,1)

# plt.ylim(-val,val)
# plt.xlim(-val,val)
# plt.xticks(np.arange(-val, val+0.01, step=step))
# plt.yticks(np.arange(-val, val+0.01, step=step))

plt.axis('equal')
plt.tight_layout()
plt.show()

f = plt.figure(figsize=[6,6])

plt.plot(xs,zs)
plt.scatter([0],[0],color='k')
plt.xlabel(r'$x$')
plt.ylabel(r'$z$')

val = 2.0
step = np.round(val/4,1)

# plt.ylim(-val,val)
# plt.xlim(-val,val)
# plt.xticks(np.arange(-val, val+0.01, step=step))
# plt.yticks(np.arange(-val, val+0.01, step=step))

plt.axis('equal')
plt.tight_layout()
plt.show()
