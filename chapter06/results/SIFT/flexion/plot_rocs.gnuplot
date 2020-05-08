#!/usr/bin/env gnuplot

load '../../mathcha.pal'

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

# Label different data points
set label 1 at graph 0.39, 0.8 'D' left front textcolor rgb '#417505'
set label 2 at graph 0.4, 0.85 'D' left front textcolor rgb '#F5A623'
set label 3 at graph 0.43, 0.972 'D' left front textcolor rgb '#4A90E2'

plot [0:1] [0:1]\
     "lehrpfad_roc.dat" u 2:1 w p ls 4 pt 13 ps 0.6 title "Lehrpfad",\
     "office_roc.dat" u 2:1 w p ls 2 pt 7 ps 0.5 title "Office",\
     "synthetic_roc.dat" u 2:1 w p ls 5 pt 5 ps 0.5 title "Synthethic",\
     x w l dt 5 lw 2 lc rgb '#4A4A4A' title "Random Guess"
