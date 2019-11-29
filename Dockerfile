FROM ubuntu:16.04
MAINTAINER CHEN, Yuelong <yuelong.chen.btr@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive
ARG remove_packages


RUN apt remove --purge --yes ${remove_packages} \
    && apt autoremove --purge --yes \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*