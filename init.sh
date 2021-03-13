#!/usr/bin/sh

CONTAINER_NAME="MAC_BASED_CN_PARSER"
ENV_FILE_NAME="env_file"
IMAGE_NAME="parse_company_name"

dockerize() {
	docker build --quiet -t $4 . &&\
	docker run -d  --env mac=$1 --env-file $2 --name $3 -p 80:80 $4 &&\
	printf "\nWaiting for log collection...\n" && sleep 6s &&\
	printf "\nCompany name for MAC $1:\n" &&\
	docker logs $3 && printf "\n\n"
}

dockerize $1 ${ENV_FILE_NAME} ${CONTAINER_NAME} ${IMAGE_NAME} && exit 0
