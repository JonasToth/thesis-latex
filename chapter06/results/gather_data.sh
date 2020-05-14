#!/bin/sh

if [ ! $(basename $(pwd)) = "final_eval" ] ; then
    echo "Execution from wrong directory!"
    exit 1
else
    echo "Gather information from results!"
fi

if [ $# -lt 2 ] ; then
    echo "Usage: $0 ALGORITHM <data_dir> [<data_dir> ...]"
    echo "Example: $0 SURF raw/default raw/one-octave-best"
    exit 1
fi

algo="$1"
shift

while [[ $# -gt 0 ]] ; do
    dir="$1"

    for dataset in lehrpfad office synthetic laserscan ; do
        for conv in flexion bearing ; do
            extract_dir="../${dataset}/${algo}/${conv}/${dir}/extracted"
            target_dir="${algo}/${conv}"

            mkdir -p "${target_dir}"

            echo "Extracting from: $(tput bold)${extract_dir}$(tput sgr0)"
            echo "Putting into: $(tput bold)${target_dir}$(tput sgr0)"

            [ ! "${dataset}" = "laserscan" ] && cp "../${dataset}/${algo}/${conv}/roc.dat" "${target_dir}/${dataset}_roc.dat"

            [ ! "${dataset}" = "laserscan" ] && cp "${extract_dir}/false_positive_distance.dat" "${target_dir}/${dataset}_fp_distance.dat"
            [ ! "${dataset}" = "laserscan" ] && cp "${extract_dir}/true_positive_distance.dat" "${target_dir}/${dataset}_tp_distance.dat"
            cp "${extract_dir}/kp_distribution.dat" "${target_dir}/${dataset}_distribution.dat"
            cp "${extract_dir}/kp_response.dat" "${target_dir}/${dataset}_response.dat"
            cp "${extract_dir}/kp_size.dat" "${target_dir}/${dataset}_size.dat"
            # back_selected.dat
            # false_positive.dat
            # relevant_elements.dat
            # true_positive.dat
            cp "${extract_dir}/keypoint_stat.yml" "${target_dir}/${dataset}_keypoint_stat.yml"
            [ ! "${dataset}" = "laserscan" ] && cp "${extract_dir}/recognition.yml" "${target_dir}/${dataset}_recognition.yml"
        done
    done

    shift
done
