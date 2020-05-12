#!/bin/sh

for d in AKAZE ORB SIFT SURF ; do
    cd "${d}" || (echo "FAILURE!!"; exit 1)
    
    for conv in */ ; do
        cd "${conv}" || (echo "FAILURE 2!!"; exit 1)
        pwd
        echo "Plotting for ${d}/${conv}"
        gnuplot plot_descriptor_distances.gnuplot
        cd ..
    done

    cd ..
done
