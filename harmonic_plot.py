import matplotlib.pyplot as plt
import numpy as np

try:
    # Imports for plotting
    import matplotlib as mpl
    import matplotlib.cm as cm
    import matplotlib.mlab as mlab
    import matplotlib.pyplot as plt
    from scipy.interpolate import InterpolatedUnivariateSpline as spline

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
    # End plotting imports
except:
    print("You don't have the ability to use sweet latex style")
    print("Continuing...")

results1 = np.genfromtxt('results-r1.out')
results10 = np.genfromtxt('results-r10.out')

xs1 = results1[:,0]
ys1 = results1[:,1]

xs10 = results10[:,0]
ys10 = results10[:,1]

#e = 0.0
#dt = 0.01

f = plt.figure(figsize=[6,6])
plt.xlim(-13.3,13.3)
plt.ylim(-13.3,13.3)

plt.plot(xs1,ys1,label=r'$r=1$')
plt.plot(xs10,ys10,label=r'$r=10$')
plt.scatter([0],[0],color='k')
plt.xlabel(r'$x$')
plt.ylabel(r'$y$')
plt.legend(loc='upper center',ncol=2)
plt.tight_layout()
plt.show()
