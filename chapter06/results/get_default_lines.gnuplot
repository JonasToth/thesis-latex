set macro
lehrpfad_default = `grep @default_name lehrpfad_roc.dat | awk '{ print $1 }'`+0
office_default = `grep @default_name office_roc.dat | awk '{ print $1 }'`+0
synthetic_default = `grep @default_name synthetic_roc.dat | awk '{ print $1 }'`+0

# vim: syntax=gnuplot
