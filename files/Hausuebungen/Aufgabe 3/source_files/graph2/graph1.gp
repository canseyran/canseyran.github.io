set terminal png size 700,500
set output 'graph1.png'
set key outside
set tics font "Arial,15"
set yrange [0:160]
set style line 2 lc rgb 'black' lt 1 lw 1
set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set boxwidth 0.5
set xtics format ""
set grid ytics

set title "Geschlechterverteilung Studiengang Informatik Sommersemester 2019/20"
plot "graph1.dat" using 2:xtic(1) title "Frauen Inland" ls 2,   \
     "graph1.dat" using 3 title "Maenner Inland" ls 2,   \
     "graph1.dat" using 4 title "Frauen Ausland" ls 2,    \
     "graph1.dat" using 5 title "Maenner Ausland" ls 2