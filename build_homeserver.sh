#!/bin/sh

latexmk -xelatex -pdf -latexoption=-shell-escape main.tex
