#!/bin/sh

cp -r ~/Freiberg/Masterarbeit/analysis/final_eval/* chapter06/results/

docker run --rm \
           --volume "$(pwd):/project" \
           -u $(id -u):$(id -g) \
           masterarbeit_latex main.tex

rm main.bbl main.nlg main.nlo main.nls
