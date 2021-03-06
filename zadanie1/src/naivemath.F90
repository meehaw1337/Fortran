module naivemath
    implicit none
    private

    public :: naivmull

    interface naivmull
        procedure naivmull4, naivmull8, naivmull16
    end interface

    contains

    function naivmull4 (A, B) result (C)
        real (kind = 4), intent(in), dimension(:,:) :: A,B
        real (kind = 4), dimension(size(A,1) , size(B,2)) :: C
        integer :: i,j,k

        C=0

        do i=1,size(A,1)
            do j=1,size(B,2)
                do k=1, size(A,2)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do 

    end function 


    function naivmull8 (A, B) result (C)
        real (kind = 8), intent(in), dimension(:,:) :: A,B
        real (kind = 8), dimension(size(A,1) , size(B,2)) :: C
        integer :: i,j,k

        C=0

        do i=1,size(A,1)
            do j=1,size(B,2)
                do k=1, size(A,2)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do 

    end function


    function naivmull16 (A, B) result (C)
        implicit none
        real (kind = 16), intent(in), dimension(:,:) :: A,B
        real (kind = 16), dimension(size(A,1) , size(B,2)) :: C
        integer :: i,j,k

        C=0

        do i=1,size(A,1)
            do j=1,size(B,2)
                do k=1, size(A,2)
                    C(i,j) = C(i,j) + A(i,k)*B(k,j)
                end do
            end do
        end do 

    end function


end module naivemath