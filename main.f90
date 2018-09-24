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
  real :: v_fac, dt, tmax, time, r, e
  integer :: nsteps, i

  ! Set e and dt
  print*,'Please enter factor times v_circ and dt'
  read*,v_fac,dt
  print*,'Please set initial radius of orbit'
  read*,r

  ! Set initial conditions and timestep
  call initialise(x, v, v_fac, r)

  ! set eccentricity if we want to work with that instead
  if (v_fac==0. .and. r==1.) then
    print*,'Enter eccentricity:'
    read*,e
    x = (/1-e,0.,0./)
    v = (/0.,sqrt((1.+e)/(1.-e)),0./)
  end if

  tmax = 10.*pi !10.0*pi
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
