FROM continuumio/miniconda3
MAINTAINER CoLoMoTo Group <contact@colomoto.org>

RUN conda config --add channels bioconda \
 && conda config --add channels colomoto

RUN conda install -y anaconda-client conda-build && conda clean -y --all


