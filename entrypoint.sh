#!/bin/bash
set -o pipefail
set -ex
[ ! -z $INPUT_SUBDIR ] && cd $INPUT_SUBDIR
conda build --user $INPUT_ANACONDA_USER --token $INPUT_ANACONDA_TOKEN \
    -c conda-forge -c potassco -c colomoto \
    $INPUT_CONDA_BUILD_OPTIONS \
    .
