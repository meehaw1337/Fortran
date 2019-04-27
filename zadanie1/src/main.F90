program main
    use naivemath
    use bettermath
    use dotmath
    implicit none

    real (kind = 4), dimension(:,:), allocatable :: m1
    real (kind = 4), dimension(:,:), allocatable :: m2
    real (kind = 4), dimension(:,:), allocatable :: m3

    real (kind = 8), dimension(:,:), allocatable :: m4
    real (kind = 8), dimension(:,:), allocatable :: m5
    real (kind = 8), dimension(:,:), allocatable :: m6

    real (kind = 16), dimension(:,:), allocatable :: m7
    real (kind = 16), dimension(:,:), allocatable :: m8
    real (kind = 16), dimension(:,:), allocatable :: m9

    integer :: m_size
    real :: start_time, stop_time
    real :: naivtime4, betttime4, dottime4, mattime4
    real :: naivtime8, betttime8, dottime8, mattime8
    real :: naivtime16, betttime16, dottime16, mattime16

    m_size = 10

    open(1, file="res/naive4results.dat")
    open(2, file="res/better4results.dat")
    open(3, file="res/dot4results.dat")
    open(4, file="res/mat4results.dat")
    

    open(10, file="res/naive8results.dat")
    open(11, file="res/better8results.dat")
    open(12, file="res/dot8results.dat")
    open(13, file="res/mat8results.dat")

    open(14, file="res/naive16results.dat")
    open(15, file="res/better16results.dat")
    open(16, file="res/dot16results.dat")
    open(17, file="res/mat16results.dat")


    do while (m_size .LT. 1281)


        allocate( m1(m_size, m_size) )
        allocate( m2(m_size, m_size) )
        allocate( m3(m_size, m_size) )

        allocate( m4(m_size, m_size) )
        allocate( m5(m_size, m_size) )
        allocate( m6(m_size, m_size) )

        allocate( m7(m_size, m_size) )
        allocate( m8(m_size, m_size) )
        allocate( m9(m_size, m_size) )
        
        call random_number(m1)
        call random_number(m2)

        call random_number(m4)
        call random_number(m5)

        call random_number(m7)
        call random_number(m8)

        ! Kind = 4 measurements
        
        call cpu_time(start_time)
        m3 = naivmull(m1,m2)
        call cpu_time(stop_time)
        naivtime4 = stop_time - start_time


        call cpu_time(start_time)
        m3 = bettmull(m1,m2)
        call cpu_time(stop_time)
        betttime4 = stop_time - start_time

        call cpu_time(start_time)
        m3 = dotmull(m1,m2)
        call cpu_time(stop_time)
        dottime4 = stop_time - start_time

        call cpu_time(start_time)
        m3 = matmul(m1,m2)
        call cpu_time(stop_time)
        mattime4 = stop_time - start_time

        ! Kind = 8 measurements

        call cpu_time(start_time)
        m6 = naivmull(m4,m5)
        call cpu_time(stop_time)
        naivtime8 = stop_time - start_time


        call cpu_time(start_time)
        m6 = bettmull(m4,m5)
        call cpu_time(stop_time)
        betttime8 = stop_time - start_time

        call cpu_time(start_time)
        m6 = dotmull(m4,m5)
        call cpu_time(stop_time)
        dottime8 = stop_time - start_time

        call cpu_time(start_time)
        m6 = matmul(m4,m5)
        call cpu_time(stop_time)
        mattime8 = stop_time - start_time


        ! Kind = 16 measurements

        call cpu_time(start_time)
        m9 = naivmull(m7,m8)
        call cpu_time(stop_time)
        naivtime16 = stop_time - start_time


        call cpu_time(start_time)
        m9 = bettmull(m7,m8)
        call cpu_time(stop_time)
        betttime16 = stop_time - start_time

        call cpu_time(start_time)
        m9 = dotmull(m7,m8)
        call cpu_time(stop_time)
        dottime16 = stop_time - start_time

        call cpu_time(start_time)
        m9 = matmul(m7,m8)
        call cpu_time(stop_time)
        mattime16 = stop_time - start_time

        
        ! Adding results to .dat files

        write (1,*) m_size, ' ', naivtime4
        write (2,*) m_size, ' ', betttime4
        write (3,*) m_size, ' ', dottime4
        write (4,*) m_size, ' ', mattime4

        write (10,*) m_size, ' ', naivtime8
        write (11,*) m_size, ' ', betttime8
        write (12,*) m_size, ' ', dottime8
        write (13,*) m_size, ' ', mattime8

        write (14,*) m_size, ' ', naivtime16
        write (15,*) m_size, ' ', betttime16
        write (16,*) m_size, ' ', dottime16
        write (17,*) m_size, ' ', mattime16

        write (*,*) m_size

        m_size = m_size*2

        deallocate(m1)
        deallocate(m2)
        deallocate(m3)

        deallocate(m4)
        deallocate(m5)
        deallocate(m6)

        deallocate(m7)
        deallocate(m8)
        deallocate(m9)
        
    end do

    close(1)
    close(2)
    close(3)
    close(4)

    close(10)
    close(11)
    close(12)
    close(13)
    
    close(14)
    close(15)
    close(16)
    close(17)
    

end program main
