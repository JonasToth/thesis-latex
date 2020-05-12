set terminal pdf color
set output "response.pdf"

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
set ylabel "Response" rotate parallel

set xrange [-0.05:0.35]
set zrange [0:]

set style fill transparent solid 0.5 noborder
unset colorbox

count_lehrpfad = "`sed -ne 's/count: \(\w\+\)$/\1/p' lehrpfad_keypoint_stat.yml | tr -d ' ' | head -n1`"+0
count_office = "`sed -ne 's/count: \(\w\+\)$/\1/p' office_keypoint_stat.yml | tr -d ' ' | head -n1`"+0
count_synthetic = "`sed -ne 's/count: \(\w\+\)$/\1/p' synthetic_keypoint_stat.yml | tr -d ' ' | head -n1`"+0
count_laserscan = "`sed -ne 's/count: \(\w\+\)$/\1/p' laserscan_keypoint_stat.yml | tr -d ' ' | head -n1`"+0

splot \
      "laserscan_response.dat" using (0.0):1:($2/count_laserscan):(0):($2/count_laserscan) with zerrorfill ls 6 title "Laserscan",\
      "lehrpfad_response.dat" using (0.1):1:($2/count_lehrpfad):(0):($2/count_lehrpfad) with zerrorfill ls 4 title "Lehrpfad",\
      "office_response.dat" using (0.2):1:($2/count_office):(0):($2/count_office) with zerrorfill ls 2 title "Office",\
      "synthetic_response.dat" using (0.3):1:($2/count_synthetic):(0):($2/count_synthetic) with zerrorfill ls 5 title "Synthetic"

# vim: syntax=gnuplot
