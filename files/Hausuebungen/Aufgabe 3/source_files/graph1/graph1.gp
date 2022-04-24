set terminal png size 800,500
set output 'graph1.png'

red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:160]
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics

set title "Geschlechterverteilung Studiengang Informatik Wintersemester 2019/20"
plot "graph1.dat" using 2:xtic(1) title "Frauen Inland" linecolor rgb red,   \
     "graph1.dat" using 3 title "Maenner Inland" linecolor rgb blue,   \
     "graph1.dat" using 4 title "Frauen Ausland" linecolor rgb green,    \
     "graph1.dat" using 5 title "Maenner Ausland" linecolor rgb skyblue