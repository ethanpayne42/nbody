This code was written for Assignment 2 of ASP3012: Star and Galaxies

### Introduction

This code solves for the trajectory of test masses in a logarithmic non-axisymmetric
potential. Using this the orbits are plotted and some cool features are seen.

### Running the code

To run the code simply download the files into one folder and then `make` the
code, before then running with the simple command `./nbody`. You will then
be greeted by some prompts to enter parameters for the initial conditions and
timesteps, where the initial conditions are defined as
```
x0 = [R, 0, 0]
v0 = [0, fac_y V, fac_z V]
```
where `fac_y` and `fac_z` are real numbers set by the user, `R` is the initial
radius, and `V = v_circ` or `v0` depending on the choice by the user. An
example prompt looks like:

```
 Select multiple of factor
 (0) vcirc
 (1) v0
0
 Please enter y factor  to times by v_circ or v0
1.0
 Please enter z factor  to times by v_circ or v0
0
 Please enter the timestep
0.01
 Please set initial radius of orbit
1.0
```

### Plotting the code

To plot the code, the user can either any of:
```
python 3D_plotter.py # plot 3D trajectory
python plotter.py # in-plane trajectories
python t_plotter.py # plot energy and angular momentum
python time_plotter.py # plot positions and radial coordinate as a function of time
```
but if the user wants quick results, simply run `make plot` and follow the prompt
as before to run `3D_plotter.py` and `plotter.py`. 
