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
ts = results[:,-1]

#e = 0.0
#dt = 0.01

f = plt.figure(figsize=[6,6])

plt.plot(ts,xs, label=r'$x$')
plt.plot(ts,ys, label=r'$y$')
plt.plot(ts,zs, label=r'$z$')

plt.xlabel(r'$t$')
plt.ylabel(r'coordinate')

plt.legend()
plt.tight_layout()
plt.show()

f = plt.figure(figsize=[9,6])

plt.plot(ts,np.sqrt(xs**2+ys**2), label=r'$x$')
plt.axvline(x=2*3.55431,color='grey',linestyle='--')
plt.axvline(x=4*3.55431,color='grey',linestyle='--')
plt.axvline(x=6*3.55431,color='grey',linestyle='--')
plt.axvline(x=8*3.55431,color='grey',linestyle='--')
#plt.axvline(x=12*np.pi)

plt.xlabel(r'$t$')
plt.ylabel(r'$R$')

plt.xlim(0,30)

plt.tight_layout()
plt.show()
