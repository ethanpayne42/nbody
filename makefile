FC=gfortran
FFLAGS=-O3 -Wall -Wextra #-fdefault-real-8

#POTEN= poten-isochrone.f90 # choice of potential used in the code
POTEN= poten-log.f90
SRC= ${POTEN} utils.f90 step.f90 init.f90 main.f90
OBJ=${SRC:.f90=.o}

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

nbody: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

plot: nbody
	./nbody
	python plotter.py
	#python time_plotter.py
	#python t_plotter.py

clean: $(OBJ)
	rm *.o *.mod nbody
