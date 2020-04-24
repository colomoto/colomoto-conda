This folder contains conda package definitions for several modelling tools. Each subfolder corresponds to a specific tool
and contains at least a metadata file (meta.yaml), and a linux build script (build.sh).

As most packages are built from existing binaries, only linux64 is currently supported (OSX and windows can wrap it into the docker image).

Install conda packages
======================


See https://conda.io/miniconda.html to download and install conda.

Inside your conda environment, use "conda install -c bioconda -c colomoto colomoto" to install all tools and the Jupyter notebook.


Build conda packages
====================

To build packages, you need to install conda-build (run "conda install conda-build" in the root conda installation),
then run "conda-build <package>" for each tool.

The conda package will be placed in "$CONDAROOT/conda-bld/linux64", it can be installed manually or uploaded on anaconda.
To upload, first install anaconda (conda install anaconda), then run "anaconda upload <package file>".


