set terminal pdf color size 4,4
set size ratio 1
set output "roc.pdf"
set style line 12 lc rgbcolor '#4A4A4A' dt 2 lw 1
set style line 13 lc rgbcolor '#9B9B9B' dt 3 lw 1
set grid xtics mxtics ytics mytics ls 12, ls 13
set mxtics
set mytics
set xlabel "False Positive Rate"
set ylabel "True Positive Rate"
set key bottom right

plot [0:1] [0:1]\
     "lehrpfad_roc.dat" u 2:1 w p ls 4 pt 13 ps 0.6 title "Lehrpfad",\
     "office_roc.dat" u 2:1 w p ls 2 pt 7 ps 0.5 title "Office",\
     "synthetic_roc.dat" u 2:1 w p ls 5 pt 5 ps 0.5 title "Synthethic",\
     x w l dt 5 lw 2 lc rgb '#4A4A4A' title "Random Guess"

# vim: syntax=gnuplot
