set terminal pdf color size 4,4
set size ratio 1
set output "roc.pdf"
set style line 12 lc rgbcolor '#9B9B9B' dt 2 lw 1
set grid xtics mxtics ytics mytics ls 12, ls 12
set mxtics
set mytics
set xlabel "False Positive Rate"
set ylabel "True Positive Rate"
set key right bottom nobox opaque

set label default_name at graph 0.02,lehrpfad_default-0.018 left font ",9" noenhanced front textcolor ls 4
set label default_name at graph 0.02,office_default-0.018 left font ",9" noenhanced front textcolor ls 2
set label default_name at graph 0.02,synthetic_default-0.018 left font ",9" noenhanced front textcolor ls 5

plot [0:1] [0:1]\
     lehrpfad_default w l ls 4 notitle,\
     office_default w l ls 2 notitle,\
     synthetic_default w l ls 5 notitle,\
     "lehrpfad_roc.dat" u 2:1 w p ls 4 pt 13 ps 0.6 title "Mine",\
     "office_roc.dat" u 2:1 w p ls 2 pt 7 ps 0.5 title "Office",\
     "synthetic_roc.dat" u 2:1 w p ls 5 pt 5 ps 0.5 title "Synthetic",\
     x w l dt 5 lw 2 lc rgb '#4A4A4A' title "Random Guess"

# vim: syntax=gnuplot
