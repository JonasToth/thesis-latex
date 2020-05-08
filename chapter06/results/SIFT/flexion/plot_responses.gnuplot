#!/usr/bin/env gnuplot

set loadpath '/home/jonas/Freiberg/Masterarbeit/gnuplot-palettes'
set terminal pdf color
set output "response.pdf"
set view 80,20
set size 1.0,1.0

# set multiplot layout 1,2
set lmargin at screen 0.17
set rmargin at screen 0.82
set tmargin at screen 1.0
set bmargin at screen 0.15

# set zrange [0.0:1.0]
# set zrange [0.0:1.0]
# splot "lehrpfad_response.dat" using (1):1:(-1):(-1):($2/count_lehrpfad) with zerrorfill title "Lehrpfad",\
      # "office_response.dat" using (2):1:(-1):(-1):($2/count_office) with zerrorfill title "Office",\
      # "synthetic_response.dat" using (3):1:(-1):(-1):($2/count_synthetic) with zerrorfill title "Synthetic",\
      # "laserscan_response.dat" using (4):1:(-1):(-1):($2/count_laserscan) with zerrorfill title "Laserscan"

unset xlabel
unset xtics
set key at screen 0.95,0.95

set xyplane at 0
set grid ytics mytics

set xrange [-0.05:0.35]
set zrange [0:]

set ylabel
set ytics 0.08
set mytics 4

set style fill transparent solid 0.5 noborder
count_lehrpfad = 321526.
count_office = 30616.
count_synthetic = 15861.
count_laserscan = 18000.
unset colorbox

load "../../mathcha.pal"

splot \
      "laserscan_response.dat" using (0.0):1:($2/count_laserscan):(0):($2/count_laserscan) with zerrorfill ls 6 title "Laserscan",\
      "lehrpfad_response.dat" using (0.1):1:($2/count_lehrpfad):(0):($2/count_lehrpfad) with zerrorfill ls 4 title "Lehrpfad",\
      "office_response.dat" using (0.2):1:($2/count_office):(0):($2/count_office) with zerrorfill ls 2 title "Office",\
      "synthetic_response.dat" using (0.3):1:($2/count_synthetic):(0):($2/count_synthetic) with zerrorfill ls 5 title "Synthetic"

# splot \
      # "lehrpfad_response.dat" using (0):1:(0):(0):($2/count_lehrpfad) with filledcurves title "Lehrpfad",\
      # "office_response.dat" using (1):1:(0):(0):($2/count_office) with filledcurves title "Office",\
      # "synthetic_response.dat" using (2):1:(0):(0):($2/count_synthetic) with filledcurves title "Synthetic",\
      # "laserscan_response.dat" using (3):1:(0):(0):($2/count_laserscan) with filledcurves title "Laserscan"
