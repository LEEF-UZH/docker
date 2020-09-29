
##### build #####

leef.base: .PHONY
	docker build --tag leef.base:latest leef.base

leef: .PHONY
	docker build --tag leef:latest leef

build: leef
	
##### run #####

run.leef.base:
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	-ti \
	leef
	
run: run.leef

run.leef:
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	-v ~/LEEF/000.NewData:/home/rstudio/LEEF/000.NewData \
	-v ~/LEEF/0.raw.data:/home/rstudio/LEEF/0.raw.data \
	-v ~/LEEF/1.pre-processed.data:/home/rstudio/LEEF/1.pre-processed.data \
	-v ~/LEEF/2.extracted.data:/home/rstudio/LEEF/2.extracted.data \
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	-ti leef \
	

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

.PHONY:
	@echo "\n\n"
	@echo "##############################################"
	@echo "### Building LEEF docker images locally... ###"
	@echo "##############################################"
	@echo "\n\n"