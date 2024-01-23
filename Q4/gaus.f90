program name
    implicit none
    real*8::u,v,s,array(20000),t,sigma
    integer::i
    sigma=2
    do i=1,10000
    s=2.0
        do while(s>1)
            call random_number(u)
            call random_number(v)
            u=2*u-1
            v=2*v-1
            s=u*u+v*v
        enddo
        t=sigma*sqrt(-(2*log(s))/s)
        array(i)=t*u
        array(10000 + i) = t * v

    enddo
    open(unit=109,file="gaus.txt")
        do i=1,20000
            write(109,*)array(i)
        enddo
    close(109)
    ! contains
    ! subroutine HistGraph(data,initial_value,final_value,bin_size,density)
        
    !     real*8, intent(in) :: data(:),initial_value,final_value,bin_size
    !     ! character,intent(in)::F1,F2
    !     ! real*8, allocatable, intent(out) ::
    !     logical,intent(in)::density
    !     real*8, allocatable :: bin_array(:), y_array(:), x_array(:)
    !     integer::number_bin,i,j,count,aa,bb
        
    !     number_bin=int(abs(-initial_value+final_value)/bin_size)
    !     allocate(bin_array(number_bin))
    !     allocate(x_array(number_bin))
    !     allocate(y_array(number_bin))
        
    !     do i=1,number_bin
    
    !         bin_array(i)=initial_value+(i-1)*bin_size
        
    !     enddo
    
    !     ! bin midpoint
    !     do i=1,number_bin
    !         x_array(i)=bin_array(i)+bin_size/2
    !     enddo
    
    !     do j=1,number_bin
    !         count=0
    !         do i=1,size(data)
    !             if (And(data(i)>=bin_array(j), data(i)<bin_array(j+1))) then
    !                 count=count+1
    !             end if    
    !         end do
    !         y_array(j)=count
    !     enddo
    !     deallocate(bin_array)
        
    !     if (density) then
    !         y_array=y_array/(size(data)*bin_size)
    !     end if

    !     open(unit=aa,file="y_100000.txt")
    !         do i=1,size(y_array)
    !         write(aa,*)y_array(i)
    !         enddo
    !     close(aa)
    
    !     open(unit=bb,file="x_100000.txt")
    !         do i=1,size(x_array)
    !         write(bb,*)x_array(i)
    !         enddo
    !     close(bb)
    
    ! end subroutine 
end program name