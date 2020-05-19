load '../../greys.pal'

set terminal pdf color size 12,3
set output "distribution.pdf"

# set title "Keypoint Distribution" noenhanced

set yrange [200:0]
set xrange [0:]
set size ratio 1
set border 15 front lc rgb '#808080' lt 1 lw 0.5
set tmargin at screen 1.0
set bmargin at screen 0.005
unset colorbox
unset xtics
unset ytics
unset xlabel
unset ylabel

set multiplot layout 1,4

# x- and ytics for each row resp. column
set lmargin at screen 0.0
set rmargin at screen 0.25
set label 1 'Laserscan' at graph 0.8,0.05 font ',12' front textcolor rgb '#000000'
plot "laserscan_distribution.dat" using 1:2:3 with image notitle
set lmargin at screen 0.25
set rmargin at screen 0.5
set label 1 'Lehrpfad' at graph 0.8,0.05 font ',12' front textcolor rgb '#000000'
plot "lehrpfad_distribution.dat" using 1:2:3 with image notitle
set lmargin at screen 0.5
set rmargin at screen 0.75
set label 1 'Office' at graph 0.8,0.05 font ',12' front textcolor rgb '#000000'
plot "office_distribution.dat" using 1:2:3 with image notitle
set lmargin at screen 0.75
set rmargin at screen 1.0
set label 1 'Synthetic' at graph 0.8,0.05 font ',12' front textcolor rgb '#000000'
plot "synthetic_distribution.dat" using 1:2:3 with image notitle
unset multiplot

# vim: syntax=gnuplot
