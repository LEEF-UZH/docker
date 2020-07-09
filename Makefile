
##### build #####

build.leef.base:
	docker build -t leef.base - < Dockerfile.leef.base

build.leef: build.leef.base
	docker build -t leef - < Dockerfile.leef

build: build.leef
	
##### runn #####

run.leef.base:
	docker run --rm -ti leef.base

run.leef:
	docker run --rm -ti leef

run: run.leef
	
# run: build
#	docker run -d -p 8787:8787 \
#		-e DISABLE_AUTH=true \
#		--name='gapminder-01-ct' \
#		-v ${HOME}:/home/rstudio/hostdata \
#		gapminder-01;
#
#	sleep 3;
#	firefox 127.0.0.1:8787;

##### stop #####

stop:
	docker stop leef

##### start #####

start:
	docker start leef

##### remove #####

remove: stop
	docker rm leef

################
