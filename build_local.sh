#!/bin/sh

docker run --rm \
           --volume "$(pwd):/project" \
           -u $(id -u):$(id -g) \
           tubaf_latex main.tex

rm main.bbl main.nlg main.nlo main.nls
