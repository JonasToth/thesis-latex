set terminal pdf color
set output "size.pdf"

set view 80,20
set size 1.0,1.0

set lmargin at screen 0.17
set rmargin at screen 0.82
set tmargin at screen 1.0
set bmargin at screen 0.15

set key at screen 0.95,0.95

set xyplane at 0
set grid ytics mytics

unset xlabel
unset xtics
set ylabel "Size" rotate parallel offset -1.8,-0.8,0

set xrange [-0.05:0.35]
set zrange [0:]
set logscale y

set style fill transparent solid 0.5 noborder
unset colorbox

# vim: syntax=gnuplot
