set terminal png size 800,500
set output 'graph1.png'

red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set key below center horizontal noreverse enhanced autotitle box dashtype solid
set yrange [0:160]
set style data line
set xtics format ""
set grid ytics
set tics font "Arial, 15"

set title "Geschlechterverteilung Studiengang Informatik Wintersemester 2021/22"
plot "graph1.dat" using 2:xtic(1) title "Frauen Inland" linecolor rgb red,   \
     "graph1.dat" using 3 title "Maenner Inland" linecolor rgb blue,   \
     "graph1.dat" using 4 title "Frauen Ausland" linecolor rgb green,    \
     "graph1.dat" using 5 title "Maenner Ausland" linecolor rgb skyblue