module init

  implicit none

contains
  ! Initialize a circular orbit
  subroutine initialise(x,v, m, np, maxp)
    integer, intent(in) :: maxp
    integer, intent(out) :: np
    real, intent(out) :: x(3,maxp), v(3,maxp)
    real, intent(out) :: m(maxp)
    real :: a, e, mtot, r, v0

    np = 2
    m(1) = 1.0
    m(2) = 1.0
    mtot = m(1) + m(2)
    !e = 0.7
    !a = 1.0
    print*,'Enter the eccentricity and semi-major axis: '
    read*,e,a

    r = a*(1+e)
    v0 = sqrt(a*(1-e**2)*mtot)/r

    x(:,1) = (/-r*m(2)/mtot,0.0,0.0/) ! body 1 position
    x(:,2) = (/r*m(1)/mtot,0.0,0.0/) ! body 2 position
    v(:,1) = (/0.0,-v0*m(2)/mtot,0.0/) ! body 1 velocity
    v(:,2) = (/0.0,v0*m(1)/mtot,0.0/) ! body 2 velocity
  end subroutine initialise

end module init
