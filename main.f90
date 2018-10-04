program nbody
  use poten
  use step
  use utils
  use init
  use output
  implicit none

  integer, parameter :: maxp=1000
  real :: x(3,maxp), v(3,maxp), a(3,maxp)
  real :: m(maxp)
  real :: dt, tmax, time
  integer :: nsteps, i, np
  integer :: nout
  real dtout

  dt = 0.01 ! timestep
  tmax = 10.
  nsteps = int(tmax/dt)+1

  ! write parameters
  dtout = 0.1
  nout = nint(dtout/dt) ! get number of steps

  ! Set initial conditions and timestep
  call initialise(x, v, m, np, maxp)
  call get_accel(x, a, m, np)


  do i=1,nsteps
    call step_leapfrog(x, v, a, m, dt, np)
    time = i*dt
    if (mod(i,nout).eq.0) call write_output(x, v, m, np, time)

  enddo

  close(unit=66)
  print*,'finished!'

end program nbody
