#
# savla-dev infra-dcos / Makefile
#

#
# VARS
#

-include .env

# define standard colors
# https://gist.github.com/rsperl/d2dfe88a520968fbc1f49db0a29345b9
ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET        := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif

export


#
# TARGETS
#

all: info

.PHONY: info
info: 
	@echo -e "\n${GREEN} ${APP_NAME} / Makefile ${RESET}\n"

	@echo -e "${YELLOW} make build   --- build project (docker image) ${RESET}"
	@echo -e "${YELLOW} make run     --- run project ${RESET}"
	@echo -e "${YELLOW} make log     --- fetch container's log ${RESET}"
	@echo -e "${YELLOW} make stop    --- stop and purge project (only docker containers!) ${RESET}"
	@echo -e ""

git_pull:
	@echo -e "\n${YELLOW} Pulling from git repo... ${RESET}\n"
	@git pull origin master

.PHONY: build
build:  git_pull
	@echo -e "\n${YELLOW} Building project (docker compose build)... ${RESET}\n"
	@docker build --tag ${DOCKER_IMAGE_NAME} .

.PHONY: run
run:	
	@echo -e "\n${YELLOW} Starting project (docker compose up)... ${RESET}\n"
	@docker compose up --detach

.PHONY: logs
logs:
	@echo -e "\n${YELLOW} Fetching container's logs (CTRL-C to exit)... ${RESET}\n"
	@docker logs ${DOCKER_CONTAINER_NAME} --follow

.PHONY: stop
stop:  
	@echo -e "\n${YELLOW} Stopping and purging project (docker compose down)... ${RESET}\n"
	@docker compose down

.PHONY: init
init:
	@docker run --detach --rm --volume ${PWD}/:/site ${DOCKER_IMAGE_NAME} new site site

ff:
	@docker run --detach --rm --name ${DOCKER_IMAGE_NAME} --volume ./:/site --expose 1313:1313 ${DOCKER_IMAGE_NAME} new site site

