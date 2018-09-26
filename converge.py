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
       'figure.figsize': [5*1.618, 5],
       'font.family':'sans',
       'font.serif':'DejaVu'
       }
    mpl.rcParams.update(params)
    # End plotting imports
except:
    print("YOu don't have the ability to use sweet latex style")

results1 = np.genfromtxt('results-dt0.01.out')
L_z1 = results1[:,-2]
energy1 = results1[:,-5]
print((np.mean(energy1)+0.5)*2)
t1 = results1[:,-1]

results2 = np.genfromtxt('results-dt0.02.out')
L_z2 = results2[:,-2]
energy2 = results2[:,-5]
print((np.mean(energy2)+0.5)*2)
t2 = results2[:,-1]

results4 = np.genfromtxt('results-dt0.04.out')
L_z4 = results4[:,-2]
energy4 = results4[:,-5]
print((np.mean(energy4)+0.5)*2)
t4 = results4[:,-1]

plt.plot(t1,energy1,label=r'$\Delta t = 0.01$')
plt.plot(t2,energy2,label=r'$\Delta t = 0.02$')
plt.plot(t4,energy4,label=r'$\Delta t = 0.04$')
plt.xlabel(r'$t$')
plt.ylabel(r'$E$')
plt.tight_layout()
plt.legend()
plt.show()

plt.plot(t1,L_z1,label=r'$\Delta t = 0.01$')
plt.plot(t2,L_z2,label=r'$\Delta t = 0.02$')
plt.plot(t4,L_z4,label=r'$\Delta t = 0.04$')
plt.xlabel(r'$t$')
plt.ylabel(r'$L_z$')
plt.tight_layout()
plt.legend()
plt.show()
