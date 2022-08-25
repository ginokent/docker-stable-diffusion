#FROM python:3.8.5
#FROM continuumio/anaconda3:2022.05
FROM continuumio/miniconda3:4.12.0

ARG SD_COMMIT_HASH=69ae4b35e0a0f6ee1af8bb9a5d0016ccb27e36dc

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

RUN set -x && \
    git clone https://github.com/CompVis/stable-diffusion.git && \
    cd stable-diffusion && \
    git checkout ${SD_COMMIT_HASH}

WORKDIR stable-diffusion

RUN set -x && \
    conda init bash && \
    conda env create -f environment.yaml && \
    echo "conda activate ldm" >> ~/.bashrc || true

