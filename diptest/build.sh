#!/bin/bash

# install using pip from the whl file provided by Google
#
set -x
echo $PY_VER

if [ `uname` == Linux ]; then
    if [ "$PY_VER" == "3.10" ]; then
        pip install https://files.pythonhosted.org/packages/78/35/e3523f38e13a20e274ec49fc9cc57eac7d9704a1716af2f194883249a983/diptest-0.5.2-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
    elif [ "$PY_VER" == "3.11" ]; then
        pip install https://files.pythonhosted.org/packages/63/77/8aed702f2604487f2af217aa8ad8f4cd8a284a3469a28398f753681d8f84/diptest-0.5.2-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
    else
        exit 1
    fi
fi
