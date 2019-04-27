program main
    use naivemath
    use bettermath
    use dotmath
    implicit none

    real (kind = 4), dimension(:,:), allocatable :: m1
    real (kind = 4), dimension(:,:), allocatable :: m2
    real (kind = 4), dimension(:,:), allocatable :: m3
    integer :: m_size
    real :: start_time, stop_time, naivtime, betttime, dottime, mattime

    m_size = 10

    open(1, file="res/naive4results.dat")
    open(2, file="res/better4results.dat")
    open(3, file="res/dot4results.dat")
    open(4, file="res/mat4results.dat")

    do while (m_size .LT. 1281)

        allocate( m1(m_size, m_size) )
        allocate( m2(m_size, m_size) )
        allocate( m3(m_size, m_size) )
        
        call random_number(m1)
        call random_number(m2)
        
        call cpu_time(start_time)
        m3 = naivmull(m1,m2)
        call cpu_time(stop_time)
        naivtime = stop_time - start_time


        call cpu_time(start_time)
        m3 = bettmull(m1,m2)
        call cpu_time(stop_time)
        betttime = stop_time - start_time

        call cpu_time(start_time)
        m3 = dotmull(m1,m2)
        call cpu_time(stop_time)
        dottime = stop_time - start_time

        call cpu_time(start_time)
        m3 = matmul(m1,m2)
        call cpu_time(stop_time)
        mattime = stop_time - start_time

        write (*,*) "========================================="

        write (*,*) "size: ", m_size 

        write (*,*) "Naivmull: ", naivtime, "s"

        write (*,*) "Bettmull: ", betttime, "s"

        write (*,*) "Dotmull: ", dottime, "s"

        write (*,*) "Matmull: ", mattime, "s"

        write (*,*) "========================================="

        write (*,*)

        write (1,*) m_size, ' ', naivtime
        write (2,*) m_size, ' ', betttime
        write (3,*) m_size, ' ', dottime
        write (4,*) m_size, ' ', mattime

        m_size = m_size*2

        deallocate(m1)
        deallocate(m2)
        deallocate(m3)
        
    end do

    close(1)
    close(2)
    close(3)
    close(4)
    

end program main