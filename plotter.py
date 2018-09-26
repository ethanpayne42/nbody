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
       'figure.figsize': [6, 6],
       'font.family':'sans',
       'font.serif':'DejaVu'
       }
    mpl.rcParams.update(params)
    # End plotting imports
except:
    print("You don't have the ability to use sweet latex style")
    print("Continuing...")

results = np.genfromtxt('results.out')

xs = results[:,0]
ys = results[:,1]

f = plt.figure(figsize=[6,6])

plt.plot(xs,ys)
plt.scatter([0],[0],color='k')
plt.xlabel(r'$x$')
plt.ylabel(r'$y$')
#plt.title(r'$v_0 = v_{esc} \approx 1.5v_{circ}$')

max_v = np.max(np.concatenate([abs(xs),abs(ys)]))
max_v += 0.2

plt.ylim(-max_v,max_v)
plt.xlim(-max_v,max_v)

plt.tight_layout()
plt.show()
#f.savefig('/home/artemis/University/Y2S2/ASP3012/CompLabs/Lab-g2/document/\
#isochrone_esc.pdf')
