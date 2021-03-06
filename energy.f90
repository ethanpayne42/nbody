module energy
  implicit none

contains
  subroutine get_conserved(x,v,m,energy, mom, angmom, np)
    use utils, only:cross_product
    use poten, only:potential
    integer, intent(in) :: np
    real, intent(in) :: x(3,np), v(3,np)
    real, intent(in) :: m(np)
    real, intent(out) :: energy
    real, intent(out) :: mom(3), angmom(3)
    real :: ekin
    real :: angi(3)
    integer :: i

    mom = 0.
    ekin = 0.
    angmom = 0.
    do i=1,np
      ekin = ekin + 0.5*m(i)*dot_product(v(:,i),v(:,i))
      mom = mom + m(i)*v(:,i)
      call cross_product(x(:,i),v(:,i),angi)
      angmom = angmom + m(i)*angi
    enddo
    energy = ekin + potential(x, m, np)
  end subroutine get_conserved
end module energy
