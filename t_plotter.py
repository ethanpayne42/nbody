import matplotlib.pyplot as plt
import numpy as np

try:
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
       'figure.figsize': [5*1.618, 5],
       'font.family':'sans',
       'font.serif':'DejaVu'
       }
    mpl.rcParams.update(params)
    # End plotting imports
except:
    print("You don't have the ability to use sweet latex style")
    print("Continuing...")

results = np.genfromtxt('results.out')

x_vec = results[:,0:3]
v_vec = results[:,3:6]
L_z = results[:,-2]
energy = results[:,-5]
t = results[:,-1]

plt.plot(t,L_z)
plt.xlabel(r'$t$')
plt.ylabel(r'$L_z$')
plt.tight_layout()
plt.show()

plt.plot(t,energy)
plt.xlabel(r'$t$')
plt.ylabel(r'$E$')
plt.tight_layout()
plt.show()
