#!/bin/bash

for d in lehrpfad synthetic office
do
    # Sort by Youden-Index and print "True-Positive-Rate, Youden, File-Name"
    echo "==== ${d}"
    tail -n +2 "${d}_roc.dat" |\
    awk 'BEGIN {OFS="\t"} {$1=substr($1,1,6); $3=substr($3,1,6); print $1, $3, $5}' |\
    sort --numeric -k 2 |\
    tail -n 10
done
