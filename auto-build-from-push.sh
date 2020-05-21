#!/usr/bin/env bash
if [ -z $OLD_REF ]; then
    echo "Define OLD_REF envvar"
    exit 1
fi
if [ -z $GITHUB_REF ]; then
    echo "Define GITHUB_REF envvar"
    exit 1
fi

echo "OSTYPE: $OSTYPE"

case "$OSTYPE" in
  darwin*) arch=macos;;
  linux*)  arch=linux;;
  msys*)   arch=win64;;
  *)        echo "unknown: $OSTYPE"; exit 1;;
esac

to_build() {
    if [[ "${arch}" == "linux" ]]; then
        true
    else
        [ -f "$1/build-${arch}" ]
    fi
}

set -ex
mod=$(git diff $OLD_REF..$GITHUB_REF --name-only| cut -d/ -f1|uniq)
mod=$(for e in $mod; do if [ -f $e/meta.yaml ] && to_build $e; then echo $e; fi; done)
echo $mod
if [ -z "${mod}" ]; then
    exit 0
fi
conda install -y anaconda-client conda-build
conda config --set anaconda_upload yes
for e in $mod; do
    conda build --user __token__ --token $ANACONDA_TOKEN \
        -c defaults -c potassco -c conda-forge -c colomoto $e
done
