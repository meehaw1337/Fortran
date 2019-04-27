# Fortran - Task 1
Matrix multiplication implementation using:
naive method
better method
method using a built-in dot_product function

# Results
https://github.com/meehaw1337/Fortran/blob/master/zadanie1/res/wykres4.pdf
https://github.com/meehaw1337/Fortran/blob/master/zadanie1/res/wykres8.pdf
https://github.com/meehaw1337/Fortran/blob/master/zadanie1/res/wykres16.pdf

# Conclusion

Suprisingly, when the prepared CMake was used, dotmull turned out to be just as slow as the naive method, but when the program was
compiled with a raw ifort command with the -std08 option, the results were as expected, this means that naivemull was the slowest,
bettermull was better and dotmull was the fastest. The results above (.pdf plots) were achieved with a program that was compiled with the prepared CMake file.
