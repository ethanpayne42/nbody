module poten
  implicit none
contains

subroutine get_accel(x, a, m, np)
  integer, intent(in) :: np
  real, intent(in) :: x(3,np)
  real, intent(out) :: a(3,np)
  real, intent(in) :: m(np)
  real :: dx(3)
  real :: r2, r
  integer :: i, j

  a = 0. ! initially set all to zero
  do i=1,np
    do j=1,2
      if (j /= i) then ! make sure that j not equal to i to not
                       ! divide by zero
        dx = x(:,i) - x(:,j)
        r2 = dot_product(dx,dx)
        r = sqrt(r2)
        a(:,i) = a(:,i) - m(j)*dx/(r*r2)

      endif
    enddo
  enddo

end subroutine get_accel

! function to return the total potential energy per unit mass
real function potential(x,m,np)
  integer, intent(in) :: np
  real, intent(in) :: x(3,np)
  real, intent(in) :: m(np)
  real :: dx(3)
  real :: phi, r
  integer :: i, j
  potential = 0.
  do i=1,2
    phi = 0. ! potential for particle i
    do j=i+1,2 ! notice loop indices
      dx = x(:,i) - x(:,j)
      r = sqrt(dot_product(dx,dx))
      phi = phi - m(j)/r
    enddo
    potential = potential + m(i)*phi
  enddo
end function potential

end module poten
