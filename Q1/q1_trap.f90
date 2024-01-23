program Trap
    implicit none
    real*8::a,b,h,f,sum,pi,error,dx
    integer::n,i,j
    pi=2*asin(1.0d0)
    write(*,*)"Trap_int of 1/(1+x^2) from 0 to 1"
    open(unit=86,file="trap.txt")
    do i=2,5
        a=0.0d0
        b=1.0d0
        dx=0.1d0**(i)
        sum=(f(a)+f(b))/2
        h=(b-a)*dx
        n=10**(i)
        do j=1,n-1
            a=a+h
            sum=sum+f(a)
        enddo
        sum=h*sum
        error=abs(pi-sum)
        write(86,*)error
        write(*,*)n,sum,error
    enddo
    close(86)

    end program Trap


real*8 function f(x) result(y)
    real*8, intent(IN)::x
    y=4/(1+x*x)
end function 