module poten
  implicit none
  !--this module defines the spherical harmonic oscillator potential
  real, parameter :: omega = 1.0
contains
  subroutine get_accel(x,a)
    real, intent(in) :: x(3)
    real, intent(out) :: a(3)
    a = -omega*x
  end subroutine get_accel

  real function potential(x)
    real, intent(in) :: x(3)
    real :: r2
    r2 = dot_product(x,x)
    potential = 0.5*omega**2*r2
  end function potential

  real function vcirc(r)
    real, intent(in) :: r
    vcirc = r*omega
  end function vcirc
end module poten
