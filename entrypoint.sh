#!/bin/bash
set -ex
set -o pipefail

[ ! -z $INPUT_SUBDIR ] && cd $INPUT_SUBDIR
conda config --set anaconda_upload yes
conda build --user $INPUT_ANACONDA_USER --token $INPUT_ANACONDA_TOKEN \
    -c conda-forge -c colomoto .
