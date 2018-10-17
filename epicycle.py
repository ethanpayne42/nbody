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

results = np.genfromtxt('results1.out')

xs = results[:,0]
ys = results[:,1]
zs = results[:,2]

results = np.genfromtxt('results.out')

xc = results[:,0]
yc = results[:,1]

Rad = np.sqrt(xs**2+ys**2)
angle = np.angle(xs+ys*1j)
angle_true = np.angle(xc+yc*1j)

R = 0.52915

xn = (Rad-R)*np.cos(angle)
yn = (Rad-R)*np.sin(angle)

f = plt.figure(figsize=[6,6])

plt.plot(xn, yn)
#plt.scatter([0],[0],color='k')
plt.xlabel(r'$x-x_c$')
plt.ylabel(r'$y-y_c$')

plt.axis('equal')
plt.tight_layout()
plt.show()
