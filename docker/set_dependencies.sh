#!/usr/bin/env bash

apt-get update && apt-get install -y --no-install-recommends \
    jq \
    libxml2-dev \
    libgit2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libfribidi-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*


Rscript settings/install_packages.R
