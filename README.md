### Information about the code

This code was written for Monash's ASP3012 class on Stars and Galaxies.

The code as it stands for this submission allows the user simulate nbody
dynamics by inserting the desired initial conditions. For this work, however,
the code is simply dealing with the 2-body problem, and simulating the result
of this calculation.

**All plots are made with splash** (god save my soul, I have little idea what I'm doing with it and I really want to do simple stuff like color the 2nd mass' points as red or something but nooooooooooooo, or call the folder `data/` so that I don't need to `cd` into it or anything but, nooooooooooooo)...

### Running the code

In order to run the code, first compile the code by running
```
make
```
in the folder where the files are located. Then the user can then run
the code to output a plot using simply `./nbody`. Following this, the user is
given some prompts for the input of the semi-major axis, eccentricity and
timestep. An example is shown below:
```
./nbody
 Enter the timestep, dt
0.01
 Enter the eccentricity and semi-major axis:
0.0 1.0
```
From this, the data is then saved as snapshots in `snap_*` files
in the `data/` directory which also contains the default settings required for
plotting with the tool `splash`. Before discussing plotting, we also save the
total energy of the system, total linear momentum, and total angular momentum
as a function of time.

### Plotting the result

To plot the results, you need to enter the `data` directory with `cd data`.
Then start up splash on the `snap_*` files,
```
splash snap_00*
```
Now, if the code was downloaded from GitHub, this will be fine, however, if
downloaded from _Moodle_, the `columns`, `evsplash.columns`,
`splash.defaults`, and `splash.limits` files need to be moved into the data
folder such as
```
mv columns.txt data/columns
```
repeat for the other files, note that the `.txt` extension needs to be
removed. Once done, the user can once again tart up splash and select the
desired plots to show.

Similarly, one can plot the general data for the system, such as energy by
using
```
splash -ev nbody.ev
```
and again choosing the appropriate plots.
