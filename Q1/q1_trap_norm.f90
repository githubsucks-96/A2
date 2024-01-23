program Trap

    implicit none
    real*8::a,b,h,f,sum,error,dx
    integer::n,i,j

    open(unit=82,file="trap_norm.txt")
    write(82,*)"Integration of gausian function from -1 to 1 with sigma=1"
    do i=2,5
        a=-3.0d0
        b=3.0d0
        dx=1/10d0**(i)
        error=0
        sum=(f(a)+f(b))/2
        h=(b-a)*dx
        n=nint(1/dx)
        do j=1,n
            a=a+h
            sum=sum+f(a)
        enddo
        sum=h*sum
        write(82,*) sum ,n
    enddo
    close(82)
end program Trap

real*8 function f(x) result(y)
    real*8, intent(IN)::x
    real*8::pi=2*asin(1.0d0)
    y=(1/(sqrt(2*(pi))))*(exp((-(x)**2)/2))
end function 