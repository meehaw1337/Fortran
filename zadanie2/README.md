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

Pierwszym krokiem było wygenerowanie sygnału na podstawie wzoru

x = sin(2 ∗ π ∗ t ∗ 200) + 2 ∗ sin(2 ∗ π ∗ t ∗ 400)

Poniżej znajduje się wykres tego sygnału w czasie:
![alt text](https://github.com/meehaw1337/Fortran/blob/master/zadanie2/res/zad1-signal-time.png)

Następnie przy użyciu funkcji biblioteki FFTW stosujemy transformatę Fouriera

![alt text](https://github.com/meehaw1337/Fortran/blob/master/zadanie2/res/zad1-signal-frequency.png)

Częstotliwości na powyższym wykresie są zgodne z wygenerowanym przez nas sygnałem. Użycie transformaty Fouriera pozwala nam dowiedzieć się, z jakich sygnałów składa się nasz sygnał wyjściowy. 


## Część 2

### Kompilacja i uruchamianie

Analogicznie jak w części pierwszej.

### Przebieg zadania i wyniki

Zadanie należało rozpocząć od wygenerowania lekko zaburzonego wykresu funkcji cosinus. Wykres poniżej.

![alt text](https://github.com/meehaw1337/Fortran/blob/master/zadanie2/res/zad2-cos-distorted-plot.png)

Kolejnym etapem było zastosowanie transformaty Fouriera do utworzenia widma powyższego sygnału.

![alt text](https://github.com/meehaw1337/Fortran/blob/master/zadanie2/res/zad2-cos-distorted-widmo-plot.png)

Możemy zredukować szum poprzez wyzerowanie wartości, których wartość bezwzględna jest mniejsza od 50. Wynik poniżej.

![alt text](https://github.com/meehaw1337/Fortran/blob/master/zadanie2/res/zad2-cos-cleared-widmo.png)

Na końcu stosujemy odwrotną transformatę Fouriera i porównujemy otrzymany wynik z czystą funkcją cosinus.

![alt text](https://github.com/meehaw1337/Fortran/blob/master/zadanie2/res/zad2-cos-clear-result-plot.png)

![alt text](https://github.com/meehaw1337/Fortran/blob/master/zadanie2/res/zad2-cos-clear-plot.png)

Jak widać, nasz wynik nie jest idealny, ale nie zmienia to faktu, że udało nam się zredukować szum.

