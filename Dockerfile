FROM continuumio/miniconda3
MAINTAINER CoLoMoTo Group <contact@colomoto.org>

RUN conda install -y anaconda-client conda-build && conda clean -y --all

ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
