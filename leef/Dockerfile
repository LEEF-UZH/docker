FROM leefuzh/leef.base:latest

COPY tools/* /home/rstudio/LEEF/tools/
 
RUN    mkdir -p /home/rstudio/LEEF/tools \
	&& mkdir -p /home/rstudio/LEEF/000.NewData \
    && mkdir -p /home/rstudio/LEEF/0.raw.data \
    && mkdir -p /home/rstudio/LEEF/1.pre-processed.data \ 
    && mkdir -p /home/rstudio/LEEF/2.extracted.data \ 
    && mkdir -p /home/rstudio/LEEF/3.archived.data \ 
    && mkdir -p /home/rstudio/LEEF/9.backend \
    \
	&& cd /home/rstudio/LEEF/tools \
    \
    && wget http://downloads.openmicroscopy.org/latest/bio-formats5.6/artifacts/bftools.zip \
    && unzip ./bftools.zip \
    && rm ./bftools.zip \  
    \
    && wget https://downloads.imagej.net/fiji/archive/20191027-2045/fiji-linux64.zip \
    && unzip ./fiji-linux64.zip \
    && rm ./fiji-linux64.zip \
	\
    && wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
	&& tar -xf ffmpeg-release-amd64-static.tar.xz --wildcards --strip=1 */ffmpeg
	
RUN R -e 'drat::addRepo("LEEF-UZH"); install.packages("LEEF")'


