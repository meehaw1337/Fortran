program zad1
    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"

    integer, parameter :: n = 2048

    real(c_double), allocatable             :: cos_clear(:)
    real(c_double), allocatable             :: cos_clear_result(:)
    real(c_double), allocatable             :: cos_distorted(:)
    complex(c_double_complex), allocatable  :: cos_distorted_out(:)
    type(c_ptr)                             :: planf, planb

    integer :: in_size   = n
    integer :: out_size  = n/2 + 1
    
    integer  :: i
    real     :: tmp
    real     :: t   = 0.0
    real     :: dt  = 5.0 / (n-1.0) 

    real :: rand1
    real :: rand2

    allocate(cos_clear(in_size))
    allocate(cos_clear_result(in_size))
    allocate(cos_distorted(in_size))
    allocate(cos_distorted_out(out_size))

    open(1, file = "../res/zad2-cos-clear")
    open(2, file = "../res/zad2-cos-distorted")
    open(3, file = "../res/zad2-cos-distorted-widmo")
    open(4, file = "../res/zad2-cos-cleared-widmo")
    open(5, file = "../res/zad2-cos-cleared-result")


    do i = 1, n
        cos_clear(i) = cos(t)
        write(1, *) t, " ", cos_clear(i)

        call random_number(rand1)
        call random_number(rand2)

        cos_distorted(i) = cos(t) + (rand1 - rand2)/10.0
        write(2, *) t, " ", cos_distorted(i)

        t = t + dt
    end do

    planf = fftw_plan_dft_r2c_1d(size(cos_distorted), cos_distorted, cos_distorted_out, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(planf, cos_distorted, cos_distorted_out)

    do i = 1, out_size
        write(3, *) i, abs(cos_distorted_out(i))

        if( abs(cos_distorted_out(i)) < 50.0) cos_distorted_out(i) = 0.0
        write(4, *) i, abs(cos_distorted_out(i))
    end do

    planb = fftw_plan_dft_c2r_1d(size(cos_distorted), cos_distorted_out, cos_clear_result, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_c2r(planb, cos_distorted_out, cos_clear_result)

    t = 0.0

    do i=1, in_size
        write(5, *) t, " ", cos_clear_result(i)/n

        t = t + dt
    end do



    call fftw_destroy_plan(planf)
    call fftw_destroy_plan(planb)

    close(1)
    close(2)
    close(3)
    close(4)
    close(5)

end program zad1