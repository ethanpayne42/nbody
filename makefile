FC=gfortran
FFLAGS=-O3 -Wall -Wextra #-fdefault-real-8

SRC= poten.f90 step.f90 main.f90
OBJ=${SRC:.f90=.o}

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

nbody: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

main.o: poten.o step.o

step.o: poten.o

clean: $(OBJ)
	rm *.o *.mod nbody
