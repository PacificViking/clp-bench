# This file is used for building the container, ensuring installation of the required tool and
# dependencies

# If there is any dedicated image available, you should build the benchmarking image on top of that
# FROM ghcr.io/y-scope/clp/clp-core-dependencies-x86-ubuntu-jammy:main

FROM spark:python3

USER root

RUN apt-get update;

RUN pip3 install pyspark;
