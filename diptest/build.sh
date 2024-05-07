#!/bin/bash

# install using pip from the whl file provided by Google
#
set -x
echo $PY_VER

if [ `uname` == Linux ]; then
    case "$PY_VER" in
        3.10) wheel="https://files.pythonhosted.org/packages/8e/81/74da486d9faa492d87b5ca48258cff30750ef91958cf10a09e2c56ebe6bf/diptest-0.8.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" ;;
        3.11) wheel="https://files.pythonhosted.org/packages/1f/5e/3f87ecae531897bda040540e2230ecd230dfbc5254e9388285342b972e32/diptest-0.8.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" ;;
        3.12) wheel="https://files.pythonhosted.org/packages/f5/d6/a5d0e89813d83c5718e5422b6719454898124878a351c8eb69bd53780266/diptest-0.8.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" ;;
        *) exit 1
    esac
    echo pip install --no-deps "$wheel"
fi
