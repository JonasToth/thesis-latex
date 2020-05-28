#!/bin/sh

# ./copy_results.sh || exit 1
# cd chapter06/results/ || exit 1
# ./produce_plots.sh || exit 1
# ./produce_tables.sh || exit 1
# cd ../../ || exit 1

docker run --rm \
           --volume "$(pwd):/project" \
           -u $(id -u):$(id -g) \
           masterarbeit_latex2 main.tex
