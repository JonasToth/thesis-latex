#!/bin/sh

for d in AKAZE ORB SIFT SURF ; do
    cd "${d}" || (echo "FAILURE!!"; exit 1)
    echo "Result Table for ${d}"
    ../parse_table.sh > absolute_numbers.tex
    cd ..
done
