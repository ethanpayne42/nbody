import matplotlib.pyplot as plt
import numpy as np

results1 = np.genfromtxt('results-dt0.01.out')
L_z1 = results1[:,-2]
energy1 = results1[:,-5]
t1 = results1[:,-1]

results2 = np.genfromtxt('results-dt0.02.out')
L_z2 = results2[:,-2]
energy2 = results2[:,-5]
t2 = results2[:,-1]

results4 = np.genfromtxt('results-dt0.04.out')
L_z4 = results4[:,-2]
energy4 = results4[:,-5]
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
plt.ylabel(r'$E$')
plt.tight_layout()
plt.legend()
plt.show()
