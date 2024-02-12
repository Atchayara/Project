#!/bin/bash

docker-compose down || true
docker-compose up -d


if [ "$GIT_COMMIT" == "origin/dev" ]; then

        docker tag reactapp:latest atchayara/dev:latest
	docker push atchayara/dev:latest

elif [ "$GIT_COMMIT" == "origin/master" ]; then

        docker tag reactapp:latest atchayara/production:latest
	docker push atchayara/production:latest
