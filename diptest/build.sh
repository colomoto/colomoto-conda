#!/bin/bash

# install using pip from the whl file provided by Google
#
set -x
echo $PY_VER

if [ `uname` == Linux ]; then
    case "$PY_VER" in
        3.10) wheel="https://files.pythonhosted.org/packages/49/50/679091e524551e1a2a86b273258a36e7a84db6a0f05d601c9b458a01f555/diptest-0.8.2-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" ;;
        3.11) wheel="https://files.pythonhosted.org/packages/d5/0b/9a3d354e78959e0bcd159317a593e2061d18cf091250bcf01a63e327006e/diptest-0.8.2-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" ;;
        3.12) wheel="https://files.pythonhosted.org/packages/dc/92/ad38a7a03e752c518cc54f96e8e008e7eebddf8074f78057c968a25a1555/diptest-0.8.2-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" ;;
        3.13) wheel="https://files.pythonhosted.org/packages/d4/0b/d75ae240eb87a327e53e7dd9a47b9fed0da0a8849456434ca976867d9136/diptest-0.8.2-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" ;;
        *) exit 1
    esac
    pip install --no-deps "$wheel"
elif [ `uname` == Darwin ]; then
    case "$PY_VER" in
        3.10) wheel="https://files.pythonhosted.org/packages/5e/ff/875497f4249495cb4dffcad782d74899a03d75b9af70703f87144c1ca7b7/diptest-0.8.2-cp310-cp310-macosx_12_0_arm64.whl" ;;
        3.11) wheel="https://files.pythonhosted.org/packages/6c/5f/0a823a39520736add57d382eb9fc82dcc0a3245d3e9cb605903fb171c503/diptest-0.8.2-cp311-cp311-macosx_12_0_arm64.whl" ;;
        3.12) wheel="https://files.pythonhosted.org/packages/06/a9/1e44e81031d221f11242795c5f82e55a5a4c81d362a1570aa3b1379b967f/diptest-0.8.2-cp312-cp312-macosx_12_0_arm64.whl" ;;
        3.13) wheel="https://files.pythonhosted.org/packages/e4/cf/1c634d401666fb63afa4291dc5dd14303e24d4f00449bb1bf515302dbad7/diptest-0.8.2-cp313-cp313-macosx_12_0_arm64.whl" ;;
        *) exit 1
    esac
    pip install --no-deps "$wheel"
else
    pip install --no-deps --only-binary=:all: diptest
fi
