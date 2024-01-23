program Trap
    implicit none
    real*16::a,b,h,f,sum,pi,error,dx
    integer::n,i,j
    pi=2*asin(1.0)
    write(*,*)"Trap_int of sin(x) from 0 t0 pi"
    open(unit=81,file="trap_sin.txt")
    do i=2,5
        a=0
        b=pi
        dx=1/10d0**(i)
        error=0
        sum=(f(a)+f(b))/2
        h=(b-a)*dx
        n=nint(1/dx)
        do j=1,n-1
            a=a+h
            sum=sum+f(a)
        enddo
        sum=h*sum
        error=abs(2-sum)
        write(81,*)error
        write(*,*)n,sum,error
    enddo
    close(81)
end program Trap


real*16 function f(x) result(y)
    real*16, intent(IN)::x
    y=sin(x)
end function 