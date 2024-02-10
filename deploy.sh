#!/bin/bash

docker-compose up -d


GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$GIT_BRANCH" = "dev" ]; then

        docker tag atchayara/reactapp:latest dev:devdeploy
	docker push atchayara/dev:devdeploy

elif [ "$GIT_BRANCH" = "master" ]; then

	docker tag atchayara/reactapp:latest prod:proddeploy
	docker push atchayara/production:proddeploy
else
    echo "Not on a deployable branch (dev or production). Deployment aborted."
    exit 1
fi
