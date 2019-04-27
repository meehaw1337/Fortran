module dotmath
    implicit none
    private

    public :: dotmull

    interface dotmull
        procedure dotmull4, dotmull8, dotmull16
    end interface

    contains

    function dotmull4 (A, B) result (C)
        real (kind = 4), intent(in), dimension(:,:) :: A,B
        real (kind = 4), dimension(size(A,1) , size(B,2)) :: C
        integer :: i,j

        C=0

        do j=1,size(B,2)
            do i=1,size(A,1)
                    C(i,j) = dot_product( A(i,:) , B(:,j) )
            end do
        end do 

    end function 


    function dotmull8 (A, B) result (C)
        real (kind = 8), intent(in), dimension(:,:) :: A,B
        real (kind = 8), dimension(size(A,1) , size(B,2)) :: C
        integer :: i,j

        C=0

        do j=1,size(B,2)
            do i=1,size(A,1)
                    C(i,j) = dot_product( A(i,:) , B(:,j) )
            end do
        end do  

    end function


    function dotmull16 (A, B) result (C)
        implicit none
        real (kind = 16), intent(in), dimension(:,:) :: A,B
        real (kind = 16), dimension(size(A,1) , size(B,2)) :: C
        integer :: i,j

        C=0

        do j=1,size(B,2)
            do i=1,size(A,1)
                    C(i,j) = dot_product( A(i,:) , B(:,j) )
            end do
        end do  

    end function


end module dotmath