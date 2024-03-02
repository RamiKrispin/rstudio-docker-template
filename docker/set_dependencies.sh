#!/usr/bin/env bash

apt-get update && apt-get install -y --no-install-recommends \
    jq \
     && rm -rf /var/lib/apt/lists/*


Rscript install_packages.R
