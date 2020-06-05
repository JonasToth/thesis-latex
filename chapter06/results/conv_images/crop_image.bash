#!/bin/bash

# Use image magic to crop the images
# Mine:
#     convert -crop 770x540+75+0 0000.png 0000_cropped.png

crop_images() {
    # $1 crop-string, e.g. "770x540+75+0" ==
    #                      "new-width x new-height + x-offset + y-offset"
    # $2 path to image directory
    cd "${2}" || exit 1
    for img in *.png ; do
        convert -crop "${1}" "${img}" "${img}"
    done 
    cd - || exit 1
}

crop_sources() {
    # $1 == base-dir, e.g. "lehrpfad/flexion"
    # $2 == data-sources, e.g. "raw bl mb", it is splitted implicitly in the for loop
    # $3 == crop-string, see "crop_images"
    for s in ${2} ; do
        crop_images "${3}" "${1}/${s}"
    done
}

# crop_sources "lehrpfad/flexion" "raw bl mb" "770x540+75+0"
# crop_sources "lehrpfad/bearing" "raw bl mb" "770x540+75+0"
# crop_sources "office/flexion" "raw bl mb" "770x540+75+0"
# crop_sources "office/bearing" "raw bl mb" "770x540+75+0"
