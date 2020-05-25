#!/bin/bash

# $1 == algorithm to gather data for (e.g. "SIFT")
# $2 == directory to get the data from (e.g. "default", "best_only")
if [ $# -ne 2 ] ; then
    echo "Usage: $0 <algorithm> <directory>"
    exit 1
fi

# Use image magic to crop the images
# Lehrpfad:
#     convert -crop 770x540+75+0 0000.png 0000_cropped.png

crop_images() {
    # $1 path to image directory
    # $2 crop-string, e.g. "770x540+75+0" ==
    #                      "new-width x new-height + x-offset + y-offset"
    cd "${1}" || exit 1
    for img in *.png ; do
        convert -crop "${2}" "${img}" "${img}"
    done
    cd - || exit 1
}

echo "Gathering Lehrpfad..."
for idx in 90 180 360 631 ; do
    cp "../lehrpfad/${1}/flexion/raw/${2}/extracted/backprojected-$(printf "%04d" ${idx}).png" \
       "${1}/backprojections/lehrpfad/" || exit 1
    crop_images "${1}/backprojections/lehrpfad/" "770x540+75+0"
done

echo "Gathering Office..."
for idx in 1 14 28 42 ; do
    cp "../office/${1}/flexion/raw/${2}/extracted/backprojected-$(printf "%04d" ${idx}).png" \
       "${1}/backprojections/office/" || exit 1
    crop_images "${1}/backprojections/office/" "770x540+75+0"
done

echo "Gathering Synthetic..."
for idx in 40 80 120 160 ; do
    cp "../synthetic/${1}/flexion/raw/${2}/extracted/backprojected-$(printf "%04d" ${idx}).png" \
       "${1}/backprojections/synthetic/" || exit 1
done

echo "Gathering Laserscan..."
for idx in 0 2 ; do
    cp "../laserscan/${1}/flexion/mb/${2}/extracted/keypoints-$(printf "%04d" ${idx}).png" \
       "${1}/backprojections/laserscan/" || exit 1
done
