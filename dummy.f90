program random_numbers_testing
    implicit none
    real*8 :: array(100000),mean,exp_x, std_x,temp,sum1
    real*8,allocatable::covariance_array(:)
    integer::i,k,n,j

    allocate( covariance_array(size(array) ))
    call random_number(array)

    open(unit = 1, file='random.dat')
    

    exp_x = mean(array)
    std_x = mean(array ** 2) - mean(array) ** 2

    print*,exp_x, sqrt(std_x)

    !auto - covariance
    n = size(array)
 do j=1,100000
    sum1=0.0d0
    k=j-1
    do i = 1,n-k
        sum1 = sum1 + (array(i)*array(i+k))
    end do
    sum1 = sum1/real(n-k)
    temp = (sum1 - exp_x* exp_x)/std_x
    write(1,'(f20.15)')temp
end do
    


end program random_numbers_testing

real*8 function mean(x) result(out)
real*8::x(100000)
out = sum(x)/size(x)
end function mean