module poten
implicit none
  contains

subroutine get_accel(x, a)
  real, intent(in) :: x(3)
  real, intent(out) :: a(3)
  real :: r2, r
  r2 = dot_product(x,x) ! dot_product is an intrinsic function in Fortran
  r = sqrt(r2) ! take the square root
  a = -x/(r2*r) ! involves vectors on both sides - Fortran can do this
end subroutine get_accel

end module poten
