FROM rocker/rstudio

RUN mkdir settings

COPY set_dependencies.sh install_packages.R packages.json ./settings/

RUN bash ./settings/set_dependencies.sh