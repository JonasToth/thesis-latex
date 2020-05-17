#!/bin/bash

# $1 == algorithm to gather data for (e.g. "SIFT")
# $2 == directory to get the data from (e.g. "default", "best_only")
if [ $# -ne 2 ] ; then
    echo "Usage: $0 <algorithm> <directory>"
    exit 1
fi

echo "Gathering Lehrpfad..."
for idx in 90 180 360 631 ; do
    cp "../lehrpfad/${1}/flexion/raw/${2}/extracted/backprojected-$(printf "%04d" ${idx}).png" \
       "${1}/backprojections/lehrpfad/" || exit 1
done

echo "Gathering Office..."
for idx in 1 14 28 42 ; do
    cp "../office/${1}/flexion/raw/${2}/extracted/backprojected-$(printf "%04d" ${idx}).png" \
       "${1}/backprojections/office/" || exit 1
done

echo "Gathering Synthetic..."
for idx in 40 80 120 160 ; do
    cp "../synthetic/${1}/flexion/raw/${2}/extracted/backprojected-$(printf "%04d" ${idx}).png" \
       "${1}/backprojections/synthetic/" || exit 1
done

echo "Gathering Laserscan..."
for idx in 0 2 ; do
    cp "../laserscan/${1}/flexion/mb/default_mldb/extracted/keypoints-$(printf "%04d" ${idx}).png" \
       "${1}/backprojections/laserscan/" || exit 1
done
