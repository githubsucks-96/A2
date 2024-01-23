real*8 function f(y)
    implicit none 
    real*8, intent(in) :: y(6)
    real*8::b
    b=(y(1)-y(4))**2+(y(2)-y(5))**2+(y(3)-y(6))**2
    f=((2*asin(1.0d0))**3)*exp(-0.5d0*b)
end function

program name
    implicit none
    
    real*8::x(6),f,ing,sigma,a,var
    integer::i,j,ten
    ing=0
    ten=10
    write(*,*)"Important Sampling Monte Carlo"
    do j=1,7
        var=0.0
        sigma=0.0d0
        a=0.0d0
        ing=0
        do i=1,10**j
            call g(6,x)
            x=sqrt(1/2.0d0)*x
            a=f(x)
            ing=ing+a
            sigma= sigma+a*a
        enddo
        ing=(ing)/ten**j
        sigma=sigma/ten**j
        var=sigma-ing*ing

        sigma=sqrt(var/ten**j)
        write(*,*)10**j,"",ing,"",sigma
    enddo

end program name
subroutine g(n,  array)
    implicit none
    integer,intent(in)::n
    real*8,intent(out)::array(n)
    real*8::u,v,s,t
    integer::i

    do i=1,n/2
    s=2.0
        do while(s>1)
            call random_number(u)
            call random_number(v)
            u=2*u-1
            v=2*v-1
            s=u*u+v*v
        enddo
        t=sqrt(-(2*log(s))/s)
        array(i)=t*u
        array(n/2 + i) = t * v

    enddo
end subroutine g
