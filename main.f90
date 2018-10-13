program nbody
  use poten
  use step
  use utils
  use init
  implicit none

  real :: x(3), v(3), a(3)
  real :: energy
  real :: angmom(3)
  real, parameter :: pi = 3.141592654
  real :: v_fac_y, v_fac_z, dt, tmax, time, r
  integer :: nsteps, i, v0_choice

  print*,'Select multiple of factor '
  print*, '(0) vcirc'
  print*, '(1) v0'
  read*, v0_choice

  ! Set e and dt
  print*,'Please enter y factor  to times by v_circ or v0'
  read*,v_fac_y
  print*,'Please enter z factor  to times by v_circ or v0'
  read*,v_fac_z
  print*,'Please enter the timestep'
  read*,dt
  print*,'Please set initial radius of orbit'
  read*,r

  ! Set initial conditions and timestep
  call initialise(x, v, v_fac_y, v_fac_z, v0_choice, r)
  tmax = 100.*pi !10.0*pi
  nsteps = int(tmax/dt) + 1 ! int() converts to integer, rounding down

  ! Get initial acceleration
  call get_accel(x, a)

  ! Open write file
  open(unit=66,file='results.out',status='replace')

  do i=1,nsteps
    call step_leapfrog(x, v, a, dt)
    time = i*dt

    ! Conserved quantities
    call cross_product(x,v,angmom)
    energy = 0.5*dot_product(v,v) + potential(x)
    !print*,'step ',i,' time ',time,' x = ',x,' v = ',v
    !print*,' angular momentum is ',angmom,'energy is ',energy
    write(66,*) x, v, a, energy, angmom, time
  enddo

  close(unit=66)
  print*,'finished!'

end program nbody
