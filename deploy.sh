#!/bin/bash

docker-compose up -d


GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch: $GIT_BRANCH" 

if [ "$GIT_BRANCH" = "dev" ]; then

        docker tag reactapp:latest atchayara/dev:latest
	docker push atchayara/dev:latest

elif [ "$GIT_BRANCH" = "master" ]; then

        docker tag reactapp:latest atchayara/production:latest
	docker push atchayara/production:latest
else
    echo "Not on a deployable branch (dev or master). Deploymenttt abored"
    exit 1
fi
