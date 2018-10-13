module init

  implicit none

contains
  ! Initialize a circular orbit
  subroutine initialise(x,v, v_fac_y, v_fac_z, v0_choice, r)
    use poten, only:vcirc
    real, intent(out) :: x(3), v(3)
    real :: r, v_fac_y, v_fac_z
    integer :: v0_choice
    if (v0_choice == 0) then
      x = (/r,0.,0./)
      v = (/0.,v_fac_y*vcirc(r),v_fac_z*vcirc(r)/)
    else
      x = (/r,0.,0./)
      v = (/0.,v_fac_y,v_fac_z/)
    endif
  end subroutine initialise

end module init
