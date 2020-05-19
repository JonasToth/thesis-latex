#!/bin/sh

for d in AKAZE ORB SIFT SURF ; do
    cd "${d}" || (echo "FAILURE!!"; exit 1)
    
    for conv in */ ; do
        [ "${conv}" = "backprojections/" ] && continue

        cd "${conv}" || (echo "FAILURE 2!!"; exit 1)
        pwd
        echo "Plotting for ${d}/${conv}"
        gnuplot plot_descriptor_distances.gnuplot
        gnuplot plot_distribution.gnuplot
        gnuplot plot_responses.gnuplot
        gnuplot plot_size.gnuplot
        gnuplot plot_rocs.gnuplot
        cd ..
    done

    cd ..
done
