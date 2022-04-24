set terminal png size 900,480
set output "graph3.png"
set tics font "Calibri,10"
set key top left outside horizontal autotitle columnhead
set title "Geschlechterverteilung Studiengang Informatik Sommersemester 2020/21"

set xtics nomirror scale 0

set ylabel "Anzahl Student/innen"
set ytics out nomirror

set grid ytics lt 0 lw 1 lc rgb "#bbbbbb"

set style data histogram
set style histogram rowstacked
set style fill solid border -1
set boxwidth 0.75

 plot "graph1.dat" using 3:xtic(1) title "Maenner Inland",   \
     "graph1.dat" using 2 title "Frauen Inland",   \
     "graph1.dat" using 5 title "Maenner Ausland",    \
     "graph1.dat" using 4 title "Frauen Ausland"