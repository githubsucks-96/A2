program name
    implicit none
    real*8::u,v,s
    call random_number(u)
    call random_number(v)
    u=2*u-1
    v=2*v-1
    s=u*u+v*v
    print*,s
end program name