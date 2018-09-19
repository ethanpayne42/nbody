module init

  implicit none

contains
  ! Initialize a circular orbit
  subroutine initialise(x,v, v_fac, r)
    use poten, only:vcirc
    real, intent(out) :: x(3), v(3)
    real :: r, v_fac
    x = (/r,0.,0./)
    v = (/0.,v_fac*vcirc(r),0./)
  end subroutine initialise

end module init
