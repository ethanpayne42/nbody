### information about the code

This code was written for Monash's ASP3012 class on Stars and Galaxies.

The code as it stands for this submission allows the user to plot orbits for
three different potentials:
1. Keplerian potentials,
2. Isochrone potentials, and
3. Spherical harmonic potentials

Furthermore, the code has the ability to analyse the data and plot the total
energy and angular momentum of the system, ensuring physical conservation laws
are obeyed.

### Running the code and plotting

In order to run the code, first compile the code by running
```
make
```
in the folder where the files are located. Then the user can then either run the
code to output a plot using simply `./nbody` or if the user wants to also
immediately see plots, the user can run
```
make plot
```
which compiles and runs the code, and also runs the plotting scripts following
the execution of the integrator.

When this is run, the user will be prompted to
enter the choice of the factor coefficient of the circular velocity for the
initial conditions of the orbit, as well as the time step and the initial radial
starting location. An example is shown below:
```
./nbody
 Please enter factor times v_circ and dt
0.5 0.01
 Please set initial radius of orbit
1.0
 finished!
python plotter.py
python t_plotter.py
```
where `plotter.py` and `t_plotter.py` plot the orbit and the conserved
quantities respectively. This will output the data to `results.out`, and plot
orbit, total energy and the z-direction of the angular momentum.

### Changing potentials

In order to use different potentials, the user needs to edit the `makefile` to
replace the `POTEN` variable with the desired potential. The lines for this are
written as such
```
# choice of potential used in the code
#POTEN=poten-isochrone.f90
#POTEN=poten-harmonic.f90
POTEN=poten-kepler.f90
```
Comment out the two undesired potentials and then make the code again, and
everything will work with the new potentials. 
