FROM rocker/rstudio:4.3.2

RUN mkdir settings

COPY set_dependencies.sh install_packages.R packages.json ./settings/

RUN bash ./settings/set_dependencies.sh

# Disabling the authentication step
ENV USER="rstudio"
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "0", "--auth-none", "1"]