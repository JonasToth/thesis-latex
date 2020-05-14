#!/bin/sh

# Collect all relevant results and data for the final analysis in the thesis.
# Automation for reproducability...

./gather_data.sh SIFT raw/default
./gather_data.sh SURF raw/one-octave-best
./gather_data.sh ORB raw/default_fast
./gather_data.sh AKAZE raw/default_mldb
