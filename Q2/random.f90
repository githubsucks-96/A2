program assignment
    use name
    implicit none

    real(8) :: random_array(10000),Avg,sigma
    integer :: xx,xy, i,yx

    call random_number(random_array)
    Avg=sum(random_array)/10000
    sigma=sqrt(sum(random_array*random_array)/10.0**4-(sum(random_array)/10000)**2)

    open(newunit=xx, file='data.txt')
    do i = 1, size(random_array)
        write(xx, *) random_array(i)
    end do
    close(xx)

    ! open(newunit=xy, file="correlation.txt")
    ! do i = 0, 1000000
    !     write(xy, *) correlation(random_array, i)
    ! end do
    ! close(xy)

    ! open(newunit=yx,file="avg_and_sigma.txt")
    ! write(yx,*)"The mean and average of random number generating function "
    ! write(yx,*)"Average","",Avg
    ! write(yx,*)"Sigma","",sigma
    ! close(yx)

end program assignment

module name

    implicit none
    
contains
function correlation(array, k) result(c)
    real(8), intent(in) :: array(:)
    integer, intent(in) :: k

    real(8) :: c, cik, ci, ci2
    integer :: n

    n = size(array)

    cik = sum(array(1 : n - k) * array(1 + k : n)) / (n - k)
    ci = sum(array) / n
    ci2 = sum(array ** 2) / n

    c = (cik - ci**2) / (ci2 - ci**2)
end function
    
end module name
