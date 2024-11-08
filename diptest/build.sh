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
    echo pip install --no-deps "$wheel"
fi
