ID = "default"

ifeq ($(ID), "default")
BEMOVI = bemovi
else
BEMOVI = bemovi.$(ID)
endif

TS = $(shell /bin/date '+%Y-%m-%d--%H-%M-%S')
	
######################################	
##### create directory structure #####
######################################	

dirs:
	mkdir -p ~/LEFF/00.general.parameter
	mkdir -p ~/LEEF/0.raw.data
	mkdir -p ~/LEEF/1.pre-processed.data
	mkdir -p ~/LEEF/2.extracted.data
	mkdir -p ~/LEEF/3.archived.data
	mkdir -p ~/LEEF/9.backend
	mkdir -p ~/LEEF_pipeline
	cp -r ./pipeline/* ~/LEEF_pipeline
	
#################################	
##### build 				#####
#################################	

leef.base: .PHONY
	docker build --tag leefuzh/leef.base:latest leef.base

leef.base.force: .PHONY
	docker build --no-cache	--tag leefuzh/leef.base:latest leef.base

build: leef
leef: .PHONY
	docker build --tag leefuzh/leef:latest leef
	
build.force: leef.force
leef.force: .PHONY
	docker build --no-cache	--tag leefuzh/leef:latest leef
	
	
#################################	
##### pull 					#####
#################################	

update: pull
pull:
	docker pull leefuzh/leef
		
#################################	
##### run	 				#####
#################################	

run.leef.base:
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	-ti \
	leefuzh/leef
	
rstudio: run.leef.rstudio
run.leef.rstudio: dirs
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	\
	-v ~/LEEF/00.general.parameter:/home/rstudio/LEEF/00.general.parameter \
	\
	-v ~/LEEF/0.raw.data:/home/rstudio/LEEF/0.raw.data \
	-v ~/LEEF/1.pre-processed.data:/home/rstudio/LEEF/1.pre-processed.data \
	-v ~/LEEF/2.extracted.data:/home/rstudio/LEEF/2.extracted.data \
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	--memory-swap=-1 \
	-ti \
	leefuzh/leef 
	
bash: run.leef.bash
run.leef.bash: dirs
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	\
	-v ~/LEEF/00.general.parameter:/home/rstudio/LEEF/00.general.parameter \
	\
	-v ~/LEEF/0.raw.data:/home/rstudio/LEEF/0.raw.data \
	-v ~/LEEF/1.pre-processed.data:/home/rstudio/LEEF/1.pre-processed.data \
	-v ~/LEEF/2.extracted.data:/home/rstudio/LEEF/2.extracted.data \
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	--memory-swap=-1 \
	-ti \
	leefuzh/leef \
	bash
	
R: run.leef.R
run.leef.R: dirs
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	\
	-v ~/LEEF/00.general.parameter:/home/rstudio/LEEF/00.general.parameter \
	\
	-v ~/LEEF/0.raw.data:/home/rstudio/LEEF/0.raw.data \
	-v ~/LEEF/1.pre-processed.data:/home/rstudio/LEEF/1.pre-processed.data \
	-v ~/LEEF/2.extracted.data:/home/rstudio/LEEF/2.extracted.data \
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	--memory-swap=-1 \
	-ti \
	leefuzh/leef \
	R

#################################	
##### run pipeline 			#####
#################################	

pipeline.all: run.pipeline.all
run.pipeline.all: dirs
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	\
	-v ~/LEEF/00.general.parameter:/home/rstudio/LEEF/00.general.parameter \	
	\
	-v ~/LEEF/0.raw.data:/home/rstudio/LEEF/0.raw.data \
	-v ~/LEEF/1.pre-processed.data:/home/rstudio/LEEF/1.pre-processed.data \
	-v ~/LEEF/2.extracted.data:/home/rstudio/LEEF/2.extracted.data/ \
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	-v ~/LEEF_pipeline:/home/rstudio/LEEF/pipeline \
	--memory-swap=-1 \
	-ti \
	leefuzh/leef \
	/home/rstudio/LEEF/pipeline/run.pipeline pipeline.all.yml


pipeline.bemovi: run.pipeline.bemovi
run.pipeline.bemovi: dirs
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	\
	-v ~/LEEF/00.general.parameter:/home/rstudio/LEEF/00.general.parameter \
	\
	-v ~/LEEF/0.raw.data/$(BEMOVI):/home/rstudio/LEEF/0.raw.data/bemovi \
	-v ~/LEEF/1.pre-processed.data/$(BEMOVI):/home/rstudio/LEEF/1.pre-processed.data/bemovi \
	-v ~/LEEF/2.extracted.data/$(BEMOVI):/home/rstudio/LEEF/2.extracted.data/bemovi \
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	-v ~/LEEF_pipeline:/home/rstudio/LEEF/pipeline \
	--memory-swap=-1 \
	-ti \
	leefuzh/leef \
	/home/rstudio/LEEF/pipeline/run.pipeline.bemovi $(ID)


test.bemovi: dirs
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	\
	-v ~/LEEF/00.general.parameter:/home/rstudio/LEEF/00.general.parameter \
	\
	-v ~/LEEF/0.raw.data/$(BEMOVI):/home/rstudio/LEEF/0.raw.data/bemovi \
	-v ~/LEEF/1.pre-processed.data/$(BEMOVI):/home/rstudio/LEEF/1.pre-processed.data/bemovi \
	-v ~/LEEF/2.extracted.data/$(BEMOVI):/home/rstudio/LEEF/2.extracted.data/bemovi \
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	-v ~/LEEF_pipeline:/home/rstudio/LEEF/pipeline \
	--memory-swap=-1 \
	-ti \
	leefuzh/leef \
	bash
	
	
pipeline.fast: run.pipeline.fast
run.pipeline.fast: dirs
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	\
	-v ~/LEEF/00.general.parameter:/home/rstudio/LEEF/00.general.parameter \
	\
	-v ~/LEEF/0.raw.data/flowcam:/home/rstudio/LEEF/0.raw.data/flowcam \
	-v ~/LEEF/0.raw.data/flowcytometer:/home/rstudio/LEEF/0.raw.data/flowcytometer \
	-v ~/LEEF/0.raw.data/manualcount:/home/rstudio/LEEF/0.raw.data/manualcount \
	-v ~/LEEF/0.raw.data/o2meter:/home/rstudio/LEEF/0.raw.data/o2meter \
	\
	-v ~/LEEF/1.pre-processed.data/flowcam:/home/rstudio/LEEF/1.pre-processed.data/flowcam \
	-v ~/LEEF/1.pre-processed.data/flowcytometer:/home/rstudio/LEEF/1.pre-processed.data/flowcytometer \
	-v ~/LEEF/1.pre-processed.data/manualcount:/home/rstudio/LEEF/1.pre-processed.data/manualcount \
	-v ~/LEEF/1.pre-processed.data/o2meter:/home/rstudio/LEEF/1.pre-processed.data/o2meter \
	\
	-v ~/LEEF/2.extracted.data/flowcam:/home/rstudio/LEEF/2.extracted.data/flowcam \
	-v ~/LEEF/2.extracted.data/flowcytometer:/home/rstudio/LEEF/2.extracted.data/flowcytometer \
	-v ~/LEEF/2.extracted.data/manualcount:/home/rstudio/LEEF/2.extracted.data/manualcount \
	-v ~/LEEF/2.extracted.data/o2meter:/home/rstudio/LEEF/2.extracted.data/o2meter \
	\
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	\
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	\
	-v ~/LEEF_pipeline:/home/rstudio/LEEF/pipeline \
	\
	--memory-swap=-1 \
	-ti \
	leefuzh/leef \
	/home/rstudio/LEEF/pipeline/run.pipeline.fast

test.fast: dirs
	docker run \
	--rm \
	-p 8787:8787 \
	-e PASSWORD=none \
	\
	-v ~/LEEF/00.general.parameter:/home/rstudio/LEEF/00.general.parameter \
	\
	-v ~/LEEF/0.raw.data/flowcam:/home/rstudio/LEEF/0.raw.data/flowcam \
	-v ~/LEEF/0.raw.data/flowcytometer:/home/rstudio/LEEF/0.raw.data/flowcytometer \
	-v ~/LEEF/0.raw.data/manualcount:/home/rstudio/LEEF/0.raw.data/manualcount \
	-v ~/LEEF/0.raw.data/o2meter:/home/rstudio/LEEF/0.raw.data/o2meter \
	\
	-v ~/LEEF/1.pre-processed.data/flowcam:/home/rstudio/LEEF/1.pre-processed.data/flowcam \
	-v ~/LEEF/1.pre-processed.data/flowcytometer:/home/rstudio/LEEF/1.pre-processed.data/flowcytometer \
	-v ~/LEEF/1.pre-processed.data/manualcount:/home/rstudio/LEEF/1.pre-processed.data/manualcount \
	-v ~/LEEF/1.pre-processed.data/o2meter:/home/rstudio/LEEF/1.pre-processed.data/o2meter \
	\
	-v ~/LEEF/2.extracted.data/flowcam:/home/rstudio/LEEF/2.extracted.data/flowcam \
	-v ~/LEEF/2.extracted.data/flowcytometer:/home/rstudio/LEEF/2.extracted.data/flowcytometer \
	-v ~/LEEF/2.extracted.data/manualcount:/home/rstudio/LEEF/2.extracted.data/manualcount \
	-v ~/LEEF/2.extracted.data/o2meter:/home/rstudio/LEEF/2.extracted.data/o2meter \
	\
	-v ~/LEEF/3.archived.data:/home/rstudio/LEEF/3.archived.data \
	\
	-v ~/LEEF/9.backend:/home/rstudio/LEEF/9.backend \
	\
	-v ~/LEEF_pipeline:/home/rstudio/LEEF/pipeline \
	\
	--memory-swap=-1 \
	-ti \
	leefuzh/leef \
	bash

#################################	
##### stop 					#####
#################################	

stop:
	docker stop leefuzh/leef

#################################	
##### start 				#####
#################################	

start:
	docker start leefuzh/leef
	
#################################	
##### remove 				#####
#################################	

remove:r emove.leef.base remove.leef
remove.leef.base: stop
	docker image rm leefuzh/leef.base

remove.leef: stop
	docker image rm leefuzh/leef
	
#################################	
##### phony	 				#####
#################################	

.PHONY:
	@echo "\n\n"
	@echo "##############################################"
	@echo "### Building LEEF docker images locally... ###"
	@echo "##############################################"
	@echo "\n\n"
	
#################################	
##### Help targets 			#####
#################################	

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

#################################	
##### the end	 			#####
#################################	
