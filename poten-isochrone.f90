module poten
  implicit none
  ! this module defines the isochrone potential
  real, parameter :: b = 0.1

contains
  subroutine get_accel(x,a)
    real, intent(in) :: x(3)
    real, intent(out) :: a(3)
    real :: r,r2,term
    r2 = dot_product(x,x)
    term = sqrt(r2 + b*b)
    a = -x/((b + term)**2*term)
  end subroutine get_accel

  real function potential(x)
    real, intent(in) :: x(3)
    real :: r2, term
    r2 = dot_product(x,x)
    term = sqrt(r2 + b*b)
    potential = -1/(b+term)
  end function potential

  ! function to define circular velocity
  real function vcirc(r)
    real, intent(in) :: r
    real :: r2, term
    r2 = r**2
    term = sqrt(r2 + b*b)
    vcirc = sqrt(r2/(term*(b+term)**2))
    print*,vcirc
  end function vcirc
  end module poten
