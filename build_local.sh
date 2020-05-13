#!/bin/sh

cp -r ~/Freiberg/Masterarbeit/analysis/final_eval/* chapter06/results/
cd chapter06/results/ || exit 1
./produce_plots.sh || exit 1
./produce_tables.sh || exit 1
cd ../../ || exit 1

docker run --rm \
           --volume "$(pwd):/project" \
           -u $(id -u):$(id -g) \
           masterarbeit_latex main.tex

rm main.bbl main.nlg main.nlo main.nls
