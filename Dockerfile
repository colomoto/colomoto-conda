FROM continuumio/miniconda3

RUN conda install -y anaconda-client conda-build && conda clean -y --all
RUN conda config --set anaconda_upload yes

ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
