program mycomplex_main
    use mycomplex
    implicit none

    type (mc) :: a
    type (mc) :: b
    type (mc) :: c

    a%re = 5
    a%im = 3

    b%re = 5
    b%im = 7

    c = a
    
    write(*,*) "a: ", a
    write(*,*) "b: ", b
    write(*,*) "a+b: ", a+b
    write(*,*) "a-b: ", a-b
    write(*,*) "a*b: ", a*b
    write(*,*) "a/b: ", a/b
    write(*,*) "c = a: ", c

end program mycomplex_main
