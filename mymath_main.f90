program mymath_main
    use mymath
    implicit none

    integer :: x = 5
    integer :: y = 8
    write(*,*) x,y
    call swap(x, y)
    write(*,*) x,y
    !call loadArgs()

end program mymath_main
