program nbody
  use poten
  use step
  use utils
  use init
  use output
  use energy
  implicit none

  integer, parameter :: maxp=1000
  real :: x(3,maxp), v(3,maxp), a(3,maxp)
  real :: m(maxp)
  real :: dt, tmax, time
  integer :: nsteps, i, np
  integer :: nout
  real :: dtout

  real :: mom(3), angm(3)
  real :: en

  !dt = 0.01 ! timestep
  print*,'Enter the timestep, dt'
  read*,dt
  tmax = 10.
  nsteps = int(tmax/dt)+1

  ! write parameters
  dtout = 0.1
  nout = nint(dtout/dt) ! get number of steps

  ! Set initial conditions and timestep
  call initialise(x, v, m, np, maxp)
  call get_accel(x, a, m, np)

  open(unit=66,file='data/nbody.ev',status='replace')
  do i=1,nsteps
    call step_leapfrog(x, v, a, m, dt, np)
    time = i*dt
    if (mod(i,nout).eq.0) call write_output(x, v, m, np, time)
    call get_conserved(x,v,m,en,mom,angm,np)
    ! print*,' t = ',time,' energy = ',en,' mom = ',mom,&
    ! ' angm = ',angm
    write(66,*) time,en,mom,angm
  enddo

  close(unit=66)
  print*,'finished!'

end program nbody
