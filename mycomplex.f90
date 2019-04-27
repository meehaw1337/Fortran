module mycomplex
    implicit none
    public

    type, public :: mc
        real :: re
        real :: im
    end type

    public :: operator(+)
    private :: mcplus
    interface operator(+)
        procedure mcplus
    end interface

    public :: operator(-)
    private :: mcminus
    interface operator(-)
        procedure mcminus
    end interface

    public :: operator(*)
    private :: mcprod
    interface operator(*)
        procedure mcprod
    end interface

    public :: operator(/)
    private :: mcdiv
    interface operator(/)
        procedure mcdiv
    end interface

    public :: assignment(=)
    private :: mcassign
    interface assignment(=)
        procedure mcassign
    end interface

    contains
    
    function mcplus(x,y) result (sum)
        type (mc), intent(in) :: x,y
        type (mc) :: sum
        sum%re = x%re + y%re
        sum%im = x%im + y%im
    end function

    function mcminus(x,y) result (diff)
        type (mc), intent(in) :: x,y
        type (mc) :: diff
        diff%re = x%re - y%re
        diff%im = x%im - y%im
    end function

    function mcprod(x,y) result (prod)
        type (mc), intent(in) :: x,y
        type (mc) :: prod
        prod%re = x%re * y%re - x%im * y%im
        prod%im = x%re * y%im + x%im * y%re
    end function

    function mcdiv(x,y) result (div)
        type (mc), intent(in) :: x,y
        type (mc) :: div
        div%re = (x%re * y%re + x%im * y%im) / (y%re * y%re + y%im * y%im)
        div%im = (y%re * x%im - x%re * y%im) / (y%re * y%re + y%im * y%im)
    end function

    subroutine mcassign(result, x)
        type (mc), intent(in) :: x
        type (mc), intent(out) :: result
        result%re = x%re
        result%im = x%im
    end subroutine

end module mycomplex


