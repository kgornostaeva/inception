DOCKER_FILE=./srcs/docker-compose.yaml
DATA_DIR=/home/pvivian/data

all: build start

re: clean build start

build:
	sudo mkdir -p ${DATA_DIR}/wordpress
	sudo mkdir -p ${DATA_DIR}/mysql
	sudo docker compose -f ${DOCKER_FILE} build  --no-cache

start:
	sudo docker compose -f ${DOCKER_FILE} up -d

network:
	echo "127.0.0.1 pvivian.42.fr" | sudo tee -a /etc/hosts

stop:
	sudo docker compose -f ${DOCKER_FILE} down

clean: stop
	sudo rm -rf ${DATA_DIR}

logs:
	sudo docker compose -f ${DOCKER_FILE} logs

.PHONY: build start re network stop clean logs all