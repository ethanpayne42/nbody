program nbody
  use poten
  use step
  implicit none
  real :: x(3), v(3), a(3)
  real :: energy
  real :: angmom(3)
  real, parameter :: pi = 3.141592654
  real :: e, dt, tmax, time
  integer :: nsteps, i

  ! Set e and dt
  print*,'Please enter e and dt'
  read*,e,dt

  ! Set initial conditions and timestep
  x = (/(1.0 - e),0.0,0.0/)
  v = (/0.0,sqrt((1.0 + e)/(1.0 - e)),0.0/)
  !dt = 0.01
  tmax = 10.0*pi
  nsteps = int(tmax/dt) + 1 ! int() converts to integer, rounding down

  ! Get initial acceleration
  call get_accel(x, a)

  ! Open write file
  open(unit=66,file='results.out',status='replace')

  do i=1,nsteps
    call step_leapfrog(x, v, a, dt)
    time = i*dt
    !print*,'step ',i,' time ',time,' x = ',x,' v = ',v
    write(66,*) x, v, a, time
  enddo

  close(unit=66)
  print*,'finished!'

end program nbody
