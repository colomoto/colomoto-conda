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
  darwin*) arch=macos
      if [[ "$(uname -m)" == "x86_64" ]]; then
          arch="${arch}64"
    fi

      ;;
  linux*)  arch=linux;;
  msys*)   arch=win64;;
  *)        echo "unknown: $OSTYPE"; exit 1;;
esac

to_build() {
    if [[ "${arch}" == "linux" ]]; then
        [ ! -f "$1/skip-linux" ]
    else
        [ -f "$1/build-${arch}" ]
    fi
}

set -ex
mod=$(git diff $OLD_REF..$GITHUB_REF --name-only|cut -d/ -f1|uniq)
mod=$(for e in $mod; do if [ -f $e/meta.yaml ] && to_build $e; then echo $e; fi; done)
echo $mod
if [ -z "${mod}" ]; then
    exit 0
fi
conda install -y anaconda-client conda-build conda-verify
conda config --set anaconda_upload yes
conda remove --name base -y conda-anaconda-telemetry
export CONDA_PLUGINS_ANACONDA_TELEMETRY='false'
for e in ${mod}; do
    cd ${e}
    conda build --user colomoto --token $ANACONDA_TOKEN --no-force-upload\
        -c defaults -c potassco -c conda-forge -c colomoto .
    cd ..
done
