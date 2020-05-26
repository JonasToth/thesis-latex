#!/usr/bin/gnuplot

load '../mathcha.pal'
set terminal pdf color
set output sprintf("%s_benchmarks.pdf", data_name)
set title sprintf("Conversion of a %s image", data_name)
set size 1.0,1.0

set border 3

set style fill solid 0.5 border 0
set style data histogram
set style histogram errorbars gap 2

set xtics nomirror
set ytics nomirror
set xtics ("Serial" 0, "Parallel" 1)
set ylabel "Runtime in [ms]"
set yrange [0:*]
set grid ytics
# set xrange [-0.5:3.5]
set datafile separator ","

plot sprintf("%s.csv", data_name) using 2:3 ls 1 title "Flexion image",\
     '' using 4:5 ls 5 title "Bearing-Angle image"

# vim: syntax=gnuplot
