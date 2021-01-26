FROM rocker/rstudio:4.0.2


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
	
RUN R -e "install.packages('BiocManager')" \
	&& R -e 'BiocManager::install("flowCore")'  

RUN install2.r --error \
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
	cellranger
	

