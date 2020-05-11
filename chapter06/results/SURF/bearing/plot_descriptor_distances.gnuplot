#!/usr/bin/env gnuplot

set terminal pdf color
set output "descriptor_distances.pdf"
set view 80,20
set size 1.0,1.0

# set multiplot layout 1,2
set lmargin at screen 0.17
set rmargin at screen 0.82
set tmargin at screen 1.0
set bmargin at screen 0.15

unset xlabel
unset xtics
set key at screen 0.95,0.95

set xyplane at 0
set grid ytics mytics

set xrange [0.05:0.35]
set yrange [0.0:]
set zrange [0:]

set ylabel
# set ytics 150
# set mytics 2

set style fill transparent solid 0.25 noborder
sel_lehrpfad = 439800.
sel_office = 34200.
sel_synthetic = 105761.
unset colorbox

load "../../mathcha.pal"

splot \
      "lehrpfad_tp_distance.dat" using (0.1):1:($2/sel_lehrpfad):(0):($2/sel_lehrpfad) with zerrorfill ls 4 title "Lehrpfad True Positives",\
      "lehrpfad_fp_distance.dat" using (0.1):1:($2/sel_lehrpfad):(0):($2/sel_lehrpfad) with zerrorfill ls 4 dt 2 title "Lehrpfad False Positives",\
      "office_tp_distance.dat" using (0.2):1:($2/sel_office):(0):($2/sel_office) with zerrorfill ls 2 title "Office True Positives",\
      "office_fp_distance.dat" using (0.2):1:($2/sel_office):(0):($2/sel_office) with zerrorfill ls 2 dt 2 title "Office False Positives",\
      "synthetic_tp_distance.dat" using (0.3):1:($2/sel_synthetic):(0):($2/sel_synthetic) with zerrorfill ls 5 title "Synthetic True Positives",\
      "synthetic_fp_distance.dat" using (0.3):1:($2/sel_synthetic):(0):($2/sel_synthetic) with zerrorfill ls 5 dt 2 title "Synthetic False Positives"
