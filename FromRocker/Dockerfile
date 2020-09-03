FROM rocker/tidyverse:4.0.2

MAINTAINER "Rainer Krug" Rainer.Krug@uzh.ch Rainer@krugs.de


# Install bftools, Fidji and ParticleLinker.jar
# RUN wget https://downloads.imagej.net/fiji/archive/20191027-2045/fiji-linux64.zip
# RUN wget https://downloads.openmicroscopy.org/latest/bio-formats5.6/artifacts/bftools.zip
# RUN wget http://wsr.imagej.net/distros/linux/ij152-linux64-java8.zip \

COPY ./tools /tools
RUN unzip /tools/bftools.zip -d /tools/ \
  && rm /tools/bftools.zip
RUN unzip /tools/fiji-linux64.zip -d /tools/ \
  && rm /tools/fiji-linux64.zip

# Install bemovi from github / master
# RUN installGithub.r /bemovi@develop \
#  && rm -rf /tmp/downloaded_packages/

# Set some variables which are for this system
RUN echo "IJ.path <- '/ImageJ/'" >> /usr/local/lib/R/etc/Rprofile.site \
    && echo "to.particlelinker <- '/ImageJ/'" >> /usr/local/lib/R/etc/Rprofile.site \
