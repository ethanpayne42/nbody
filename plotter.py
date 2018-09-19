import matplotlib.pyplot as plt
import numpy as np

results = np.genfromtxt('results.out')

xs = results[:,0]
ys = results[:,1]

#e = 0.0
#dt = 0.01

f = plt.figure(figsize=[6,6])

plt.plot(xs,ys)
plt.scatter([0],[0],color='k')
plt.xlabel(r'$x$')
plt.ylabel(r'$y$')

val = 2.0
step = np.round(val/4,1)

plt.ylim(-val,val)
plt.xlim(-val,val)
plt.xticks(np.arange(-val, val+0.01, step=step))
plt.yticks(np.arange(-val, val+0.01, step=step))

plt.tight_layout()
plt.show()
