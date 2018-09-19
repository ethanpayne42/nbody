import matplotlib.pyplot as plt
import numpy as np

results1 = np.genfromtxt('results-r1.out')
results10 = np.genfromtxt('results-r10.out')

xs1 = results1[:,0]
ys1 = results1[:,1]

xs10 = results10[:,0]
ys10 = results10[:,1]

#e = 0.0
#dt = 0.01

f = plt.figure(figsize=[6,6])

plt.plot(xs1,ys1,label=r'$r=1$')
plt.plot(xs10,ys10,label=r'$r=10$')
plt.scatter([0],[0],color='k')
plt.xlabel(r'$x$')
plt.ylabel(r'$y$')
plt.legend()
plt.tight_layout()
plt.show()
