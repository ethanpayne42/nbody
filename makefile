FC=gfortran
FFLAGS=-O3 -Wall -Wextra -fcheck=all #-fdefault-real-8

SRC=utils.f90 poten.f90 energy.f90 output.f90 \
init.f90 step.f90 main.f90
OBJ=${SRC:.f90=.o}

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

fdefault: nbody data

nbody: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

plot: nbody
	./nbody
	python plotter.py
	python t_plotter.py

data:
	mkdir data

clean: $(OBJ)
	rm *.o *.mod nbody
