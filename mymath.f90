module mymath
    implicit none
    private

    public :: swap
    integer, public, protected :: arg_count

    character(100), allocatable, public, protected :: args(:)

    integer :: i
    public :: loadArgs


    interface swap
        procedure swap_int, swap_real, swap_complex, swap_logical
    end interface

    contains

    subroutine loadArgs()
        integer :: l, s
        arg_count = command_argument_count()

        allocate(args(arg_count))
    
        do i=1,arg_count
            call get_command_argument(i, args(i), l, s)
        end do
    
        write(*,*) args    
    end subroutine
    

    elemental subroutine swap_int(x, y)
        integer, intent(inout) :: x, y
        integer :: tmp
        tmp = x
        x = y
        y = tmp
    end subroutine

    elemental subroutine swap_real(x, y)
        real, intent(inout) :: x, y
        real :: tmp
        tmp = x
        x = y
        y = tmp
    end subroutine

    elemental subroutine swap_complex(x, y)
        complex, intent(inout) :: x, y
        complex :: tmp
        tmp = x
        x = y
        y = tmp
    end subroutine

    elemental subroutine swap_logical(x, y)
        logical, intent(inout) :: x, y
        logical :: tmp
        tmp = x
        x = y
        y = tmp
    end subroutine

end module mymath

