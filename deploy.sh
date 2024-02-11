#!/bin/bash

docker-compose up -d


GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$GIT_BRANCH" = "dev" ]; then

        docker tag reactapp:latest atchayara/dev:latest
	docker push atchayara/dev:latest

elif [ "$GIT_BRANCH" = "master" ]; then

        docker tag reactapp:latest atchayara/production:latest
	docker push atchayara/production:latest
else
    echo "Not on a deployable branch (dev or master). Deployment aborted."
    exit 1
fi
