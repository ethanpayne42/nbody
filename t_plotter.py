import matplotlib.pyplot as plt
import numpy as np

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
