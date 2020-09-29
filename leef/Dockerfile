FROM leef.base:latest

COPY tools/* /home/rstudio/LEEF/tools/

RUN mkdir -p /home/rstudio/LEEF/000.NewData \
    && mkdir -p /home/rstudio/LEEF/0.raw.data \
    && mkdir -p /home/rstudio/LEEF/1.pre-processed.data \ 
    && mkdir -p /home/rstudio/LEEF/2.extracted.data \ 
    && mkdir -p /home/rstudio/LEEF/3.archived.data \ 
    && mkdir -p /home/rstudio/LEEF/9.backend \
    \
	&& cd /home/rstudio/LEEF/tools \
    \
    && unzip ./bftools.zip \
    && rm ./bftools.zip \  
    \
    && unzip ./fiji-linux64.zip \
    && rm ./fiji-linux64.zip \
	\
	&& tar -xf ffmpeg-release-amd64-static.tar.xz --wildcards --strip=1 */ffmpeg
	
RUN R -e 'drat::addRepo("LEEF-UZH");install.packages("LEEF")'


RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    openjdk-11-jdk-headless