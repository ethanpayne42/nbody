module step
  implicit none
contains

  ! Sub routine for moving the solution one step forward in time
  subroutine step_leapfrog(x,v,a,dt)
    use poten
    real, intent(inout) :: x(3), v(3), a(3)
    real, intent(in) :: dt
    v = v + 0.5*dt*a ! find v at half step - Eq. 4 in notes
    x = x + dt*v ! x ’leapfrogs’ over v    - Eq. 5 in notes
    call get_accel(x,a) ! Get acc at x_n+1 - Eq. 6 in notes
    v = v + 0.5*dt*a ! Get the new v from
                     ! the previous steps  - Eq. 7 in notes

  end subroutine step_leapfrog
end module step
