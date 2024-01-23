program name
    implicit none
    real*8::array(100000),c,new_random(100000)
    integer::i
    call random_number(array)
    c=2.0
    new_random= - log((1.0d0 - array)) / c
    open(unit=76,file="exp.txt")
        do i=1,100000
            write(76,*)new_random(i)
        enddo
    close(69)

    contains
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