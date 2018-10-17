module poten
  implicit none
  ! this module defines the isochrone potential
  real, parameter :: v0 = 1.0
  real, parameter :: q = 0.8
  real, parameter :: Rc = 0.2


contains
  subroutine get_accel(x,a)
    real, intent(in) :: x(3)
    real, intent(out) :: a(3)
    real :: R, R2, fac

    ! Get the inplane radial component
    R2 = dot_product(x(1:2),x(1:2))
    R = sqrt(R2)

    fac = Rc**2+R2+x(3)**2/q**2

    a(1) = - v0**2*x(1)/fac
    a(2) = - v0**2*x(2)/fac
    a(3) = - v0**2*x(3)/(q**2*fac)

  end subroutine get_accel

  real function potential(x)
    real, intent(in) :: x(3)
    real :: R2

    R2 = dot_product(x(1:2),x(1:2))
    potential = 0.5*v0**2*log(Rc**2+R2+x(3)**2/q**2)
  end function potential

  ! function to define circular velocity
  real function vcirc(R)
    real, intent(in) :: R

    vcirc = v0*R*sqrt(1./(R**2+Rc**2))
  end function vcirc

end module poten
