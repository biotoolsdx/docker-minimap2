FROM ubuntu:16.04
MAINTAINER CHEN, Yuelong <yuelong.chen.btr@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive
ARG remove_packages='wget bzip2'

ARG minimap2_version=2.17

RUN apt update \
    && apt install -y ${remove_packages}

RUN cd /tmp/ \
    && wget https://github.com/lh3/minimap2/releases/download/v${minimap2_version}/minimap2-${minimap2_version}_x64-linux.tar.bz2
    && tar -jxvf minimap2-${minimap2_version}_x64-linux.tar.bz2 \
    && cd minimap2-${minimap2_version}_x64-linux \
    && cp minimap2 k8 paftools.js /usr/local/bin/

RUN apt remove --purge --yes ${remove_packages} \
    && apt autoremove --purge --yes \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

CMD bash