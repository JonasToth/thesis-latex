#!/bin/bash

copy_conversion() {
    # $1 == {'flexion', 'bearing'}
    # $2 == {'raw', 'bl', 'mb'}
    # $3 == base-dir of analysis data
    # $4 == increment for images
    # $5 == number of images
    # $6 == target directory
    source_dir="${3}/converted/${1}/${2}"
    target_dir="${6}/${1}/${2}"
    mkdir -p "${target_dir}"

    for (( i=0; i<$5; i++ )) ; do
        fname=$(printf "%04d.png" $((${i}*${4})))
        cp "${source_dir}/${fname}" "${target_dir}/${fname}"
    done
}

copy_dataset() {
    # $1 == source-path of dataset
    # $2 == target-path for images
    # $3 == increment
    # $4 == number of images
    for conv in flexion bearing ; do
        for filter in raw bl mb ; do
            copy_conversion ${conv} ${filter} "${1}" "${3}" "${4}" "${2}"
        done
    done
}

copy_dataset "/data/big/evaluation-data/synthetic" "synthetic" 40 5
copy_dataset "/data/big/evaluation-data/lehrpfad" "lehrpfad" 90 8
copy_dataset "/data/big/evaluation-data/office" "office" 14 4
copy_dataset "/data/big/evaluation-data/laserscan" "laserscan" 2 2
