import matplotlib.pyplot as plt
import numpy as np

results = np.genfromtxt('results.out')

xs = results[:,0]
ys = results[:,1]

f = plt.figure(figsize=[6,6])

plt.plot(xs,ys)
plt.scatter([0],[0],color='k')
plt.xlabel(r'$x$')
plt.ylabel(r'$y$')

max_v = np.max(np.concatenate([abs(xs),abs(ys)]))
max_v += 0.2
print(max_v)

plt.ylim(-max_v,max_v)
plt.xlim(-max_v,max_v)

plt.tight_layout()
plt.show()
