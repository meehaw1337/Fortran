program zad1
    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"

    integer, parameter :: n = 1000

    real(c_double), allocatable             :: data_in(:)
    complex(c_double_complex), allocatable  :: data_out(:)
    type(c_ptr)                             :: planf

    integer :: in_size   = n
    integer :: out_size  = n/2 + 1
    
    integer :: tmp
    integer :: i
    real    :: t   = 0
    real    :: dt  = 1 / (n-1) 

    allocate(data_in(in_size))
    allocate(data_out(out_size))

    open(1, file = "../res/zad1-signal-time")
    open(2, file = "../res/zad1-signal-frequency")

    do i = 1, n
        data_in(i) = sin(2 * 3.1415 * t * 200) + 2 * sin(2 * 3.1415 * t * 400)
        write(1, *) t, " ", data_in(i)

        t = t + dt
    end do

    planf = fftw_plan_dft_r2c_1d(size(data_in), data_in, data_out, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(planf, data_in, data_out)

    do i = 1, out_size
        tmp = abs(data_out(i))
        write(2, *) i, tmp
    end do

    call fftw_destroy_plan(planf)
    

end program zad1