FROM rocker/rstudio:4.1.0


RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
	libxml2-dev \
  libcairo2-dev \
  libsqlite-dev \
  libtiff-dev \
  libssh2-1-dev \
  libssl-dev \
	libpq-dev \
  libcairo2-dev \
	libxt-dev \
	openjdk-11-jdk-headless \
	\
  libx11-6 \
  libxss1 \
  libxt6 \
  libxext6 \
  libsm6 \
  libice6 \
  xdg-utils \
  \
  mc 
	
## CRAN Packages

RUN install2.r -n 10 -r https://cloud.r-project.org/ --error \
	--deps TRUE \
	ps \ 
	utf8 \ 
	processx \ 
  mvtnorm \ 
  pillar \ 
	pkgconfig \ 
	purrr \ 
	sys \ 
	callr \ 
  prettyunits \ 
	backports \ 
	data.table \ 
  circular \ 
	settings \ 
  generics \ 
	lifecycle \ 
	tibble \ 
	tidyselect \ 
	vctrs \ 
	hms \ 
	clipr \ 
	askpass \ 
	assertthat \ 
	fansi \ 
	desc \ 
	pkgbuild \ 
	rprojroot \ 
  rstudioapi \ 
	dplyr \ 
  readr \ 
	tiff \ 
	openssl \ 
	cli \ 
	crayon \ 
	ellipsis \ 
	pkgload \ 
  praise \ 
	R6 \ 
	withr \ 
	R.oo \ 
  R.methodsS3 \ 
	testthat \ 
	R.utils \
	shiny \
	drat \
	randomForest \
	readxl \
	progress \
	cellranger \ 
	BH
	
## Bioconductor packages

RUN R -e "install.packages('BiocManager')"

RUN R -e 'BiocManager::install("cytolib")'
RUN  R -e 'BiocManager::install("flowCore")'  

	
RUN mkdir -p /home/rstudio/LEEF/tools \
	&& mkdir -p /home/rstudio/LEEF/0.raw.data \
	&& mkdir -p /home/rstudio/LEEF/1.pre-processed.data \ 
	&& mkdir -p /home/rstudio/LEEF/2.extracted.data \ 
	&& mkdir -p /home/rstudio/LEEF/3.archived.data \ 
   	&& mkdir -p /home/rstudio/LEEF/9.backend \
	\
	&& cd /home/rstudio/LEEF/tools \
	\
	&& wget --no-verbose http://downloads.openmicroscopy.org/latest/bio-formats5.6/artifacts/bftools.zip \
	&& unzip ./bftools.zip \
	&& rm ./bftools.zip \  
	\
	&& wget --no-verbose https://downloads.imagej.net/fiji/archive/20191027-2045/fiji-linux64.zip \
	&& unzip ./fiji-linux64.zip \
	&& rm ./fiji-linux64.zip \
	\
	&& wget --no-verbose https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
	&& tar -xf ffmpeg-release-amd64-static.tar.xz --wildcards --strip=1 */ffmpeg \
	&& rm ./ffmpeg-release-amd64-static.tar.xz \
	\
	&& wget --no-verbose https://github.com/LEEF-UZH/docker/raw/master/leef/tools/ParticleLinker.jar

##################################################
##################################################
##                                              ##
##          NO EDITING ABOVE                    ##
## Add new dependencies in RUN statements below ##
##                                              ##
##################################################
##################################################

RUN install2.r -n 10 -r https://cloud.r-project.org/ --error \
	--deps TRUE \
	plyr
	
 
