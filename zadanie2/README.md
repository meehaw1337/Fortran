# Fortran - zadanie 2

### Uwaga

Do realizacji zadania skorzystano z szablonu FFTW do Fortrana. Link do szablonu: 
https://gist.github.com/LadaF/73eb430682ef527eea9972ceb96116c5?fbclid=IwAR1pqshIrm2Wt9PYbJe5zUeMjFFOBIbY7hcHq3XZxrebIwgm8yBqne4xhKs

## Część 1

### Kompilacja i uruchamianie

Podczas kompilacji programu należy pamiętać, aby w poleceniu kompilującym program umieścić ścieżkę do pliku libfftw3.a,
który znajduje się w katalogu z biblioteką FFTW w folderze .libs. Następnie wykonujemy polecenie make zad1, po czym uruchamiamy
program poleceniem ./zad1.

### Przebieg zadania i wyniki

Pierwszym krokiem było wygenerowanie sygnału na podstawie wzoru   x = sin(2 ∗ π ∗ t ∗ 200) + 2 ∗ sin(2 ∗ π ∗ t ∗ 400)
Poniżej znajduje się wykres tego sygnału w czasie:
![alt text](https://github.com/meehaw1337/Fortran/zadanie2/res/zad1-signal-time.png)

