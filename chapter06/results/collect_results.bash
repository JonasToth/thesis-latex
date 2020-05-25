#!/bin/bash

# Collect all relevant results and data for the final analysis in the thesis.
# Automation for reproducability...

./gather_data.bash SIFT raw/default
./gather_data.bash SURF raw/one-octave-best
./gather_data.bash ORB raw/default_fast
./gather_data.bash AKAZE raw/default_mldb

./get_backprojections.bash SIFT default
./get_backprojections.bash AKAZE best_only
