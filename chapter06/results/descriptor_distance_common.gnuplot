set terminal pdf color
set output "descriptor_distances.pdf"

set view 80,20
set size 1.0,1.0

set lmargin at screen 0.175
set rmargin at screen 0.82
set tmargin at screen 1.0
set bmargin at screen 0.15

unset xlabel
unset xtics
set ylabel "Descriptor Distance" rotate parallel offset -2,-0.5,0

set key at screen 0.95,0.95
set xyplane at 0
set grid ytics mytics

set xrange [0.05:0.35]
set yrange [0.0:]
set zrange [0:]

set style fill transparent solid 0.25 noborder
unset colorbox

tp_lehrpfad = "`sed -ne 's/true_positives: \(\w\+\)$/\1/p' lehrpfad_recognition.yml | tr -d ' '`"+0
fp_lehrpfad = "`sed -ne 's/false_positives: \(\w\+\)$/\1/p' lehrpfad_recognition.yml | tr -d ' '`"+0
tp_office = "`sed -ne 's/true_positives: \(\w\+\)$/\1/p' office_recognition.yml | tr -d ' '`"+0
fp_office = "`sed -ne 's/false_positives: \(\w\+\)$/\1/p' office_recognition.yml | tr -d ' '`"+0
tp_synthethic = "`sed -ne 's/true_positives: \(\w\+\)$/\1/p' synthetic_recognition.yml | tr -d ' '`"+0
fp_synthethic = "`sed -ne 's/false_positives: \(\w\+\)$/\1/p' synthetic_recognition.yml | tr -d ' '`"+0
splot \
      "lehrpfad_tp_distance.dat" using (0.1):1:($2/tp_lehrpfad):(0):($2/tp_lehrpfad) with zerrorfill ls 4 title "Mine TP",\
      "lehrpfad_fp_distance.dat" using (0.1):1:($2/fp_lehrpfad):(0):($2/fp_lehrpfad) with zerrorfill ls 4 dt 2 title "Mine FP",\
      "office_tp_distance.dat" using (0.2):1:($2/tp_office):(0):($2/tp_office) with zerrorfill ls 2 title "Office TP",\
      "office_fp_distance.dat" using (0.2):1:($2/fp_office):(0):($2/fp_office) with zerrorfill ls 2 dt 2 title "Office FP",\
      "synthetic_tp_distance.dat" using (0.3):1:($2/tp_synthethic):(0):($2/tp_synthethic) with zerrorfill ls 5 title "Synthetic TP",\
      "synthetic_fp_distance.dat" using (0.3):1:($2/fp_synthethic):(0):($2/fp_synthethic) with zerrorfill ls 5 dt 2 title "Synthetic FP"

# vim: syntax=gnuplot
