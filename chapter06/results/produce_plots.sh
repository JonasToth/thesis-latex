#!/bin/sh

for d in AKAZE ORB SIFT SURF ; do
    cd "${d}" || (echo "FAILURE!!"; exit 1)
    
    for conv in */ ; do
        [ "${conv}" = "backprojections/" ] && continue

        cd "${conv}" || (echo "FAILURE 2!!"; exit 1)
        pwd
        echo "Plotting for ${d}/${conv}"
        if [ "${conv}" = "bearing/" ] ; then
            title="Bearing-Angle Images"
        else
            title="Flexion Images"
        fi
        gnuplot plot_descriptor_distances.gnuplot
        gnuplot -e "plot_title=\"${title}\"" plot_distribution.gnuplot
        gnuplot plot_responses.gnuplot
        gnuplot plot_size.gnuplot
        gnuplot plot_rocs.gnuplot
        cd ..
    done

    cd ..
done

cd benchmarks || exit 1
echo "Plotting benchmarks"
gnuplot -e "data_name='pinhole'; title_sub='pinhole image'" plot_benchmarks.gnuplot || exit 1
gnuplot -e "data_name='laserscan'; title_sub='LiDAR scan'" plot_benchmarks.gnuplot || exit 1
cd .. || exit 1
