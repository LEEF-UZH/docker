FROM fiji/fiji:fiji-openjdk-8


## Install R 4.0.2
## Copied from 
##     https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/Dockerfile_r-ver_4.0.2

LABEL org.label-schema.license="GPL-2.0" \
      maintainer=" Rainer M Krug <Rainer@krugs.de>"

ENV R_VERSION=4.0.2
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV R_HOME=/usr/local/lib/R
ENV CRAN=https://packagemanager.rstudio.com/all/__linux__/focal/latest
ENV TZ=UTC

COPY ./install_R.sh /LEEF_scripts/ 

RUN /LEEF_scripts/install_R.sh

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite-dev \
  libtiff-dev \
  libssh2-1-dev \
  libssl-dev \ 
  && R -e "install.packages('BiocManager')" \
  && install2.r --error \
    --deps TRUE \
    drat
##    dplyr \
##    ggplot2 \
##    devtools \
##    formatR \
##    remotes \
##    selectr

CMD ["R"]
