program name
    implicit none
    real*8::x(6),v,f,ing,ten,sigma,a,var
    integer::i,j

    v=10**6
    ing=0
    ten=10.0
    write(*,*)"Brute force Monte Carlo"
    do j=1,7
        var=0.0
        sigma=0.0
        a=0.0
        ing=0
        do i=1,10**j
            x=0
            call random_number(x)
            x=-5+10*x
            a=f(x)
            ing=ing+a
            sigma= sigma+a*a
            
        enddo
        ing=(ing)/ten**j
        sigma=sigma/ten**j
        var=sigma-ing*ing

        ing=v*ing
        sigma=v*sqrt(var/ten**j)
        write(*,*)10**j,"",ing,"",sigma
    enddo
end program name

real*8 function f(y)
    implicit none 
    real*8, intent(in) :: y(6)
    real*8::a,b
    
    a=y(1)*y(1)+y(2)*y(2)+y(3)*y(3)+y(4)*y(4)+y(5)*y(5)+y(6)*y(6)
    b=(y(1)-y(4))**2+(y(2)-y(5))**2+(y(3)-y(6))**2
    f=exp(-a-0.5d0*b)
    
end function