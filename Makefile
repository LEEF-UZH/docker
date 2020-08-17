
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

############# Help targets #############

list: list_variables list_targets

list_variables:
	@echo
	@echo "#############################################"
	@echo "## Variables ################################"
	make -pn | grep -A1 "^# makefile"| grep -v "^#\|^--" | sort | uniq
	@echo "#############################################"
	@echo ""

## from https://stackoverflow.com/a/26339924/632423
list_targets:
	@echo
	@echo "#############################################"
	@echo "## Targets    ###############################"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
	@echo "#############################################"
	@echo

list: list_variables list_targets
