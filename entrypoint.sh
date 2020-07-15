#!/bin/bash
set -o pipefail
set -ex
[ ! -z $INPUT_SUBDIR ] && cd $INPUT_SUBDIR
conda build --no-build-id --user $INPUT_ANACONDA_USER --token $INPUT_ANACONDA_TOKEN \
    -c defaults -c conda-forge -c potassco -c colomoto \
    $INPUT_CONDA_BUILD_OPTIONS \
    .
