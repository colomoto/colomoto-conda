#!/bin/bash

#$PYTHON setup.py install 
mkdir -p "${PREFIX}/site-packages"
cp -r pypint "${PREFIX}/site-packages"

