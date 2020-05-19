count_lehrpfad = "`sed -ne 's/count: \(\w\+\)$/\1/p' lehrpfad_keypoint_stat.yml | tr -d ' ' | head -n1`"+0
count_office = "`sed -ne 's/count: \(\w\+\)$/\1/p' office_keypoint_stat.yml | tr -d ' ' | head -n1`"+0
count_synthetic = "`sed -ne 's/count: \(\w\+\)$/\1/p' synthetic_keypoint_stat.yml | tr -d ' ' | head -n1`"+0
count_laserscan = "`sed -ne 's/count: \(\w\+\)$/\1/p' laserscan_keypoint_stat.yml | tr -d ' ' | head -n1`"+0

splot \
      "laserscan_size.dat" using (0.0):1:($2/count_laserscan):(0):($2/count_laserscan) with zerrorfill ls 6 title "Laserscan",\
      "lehrpfad_size.dat" using (0.1):1:($2/count_lehrpfad):(0):($2/count_lehrpfad) with zerrorfill ls 4 title "Lehrpfad",\
      "office_size.dat" using (0.2):1:($2/count_office):(0):($2/count_office) with zerrorfill ls 2 title "Office",\
      "synthetic_size.dat" using (0.3):1:($2/count_synthetic):(0):($2/count_synthetic) with zerrorfill ls 5 title "Synthetic"
