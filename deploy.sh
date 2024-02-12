#!/bin/bash

docker-compose down || true
docker-compose up -d


if [ "$GIT_BRANCH" == "origin/dev" ]; then

        docker tag reactapp:latest atchayara/dev:latest
	docker push atchayara/dev:latest

elif [ "$GIT_BRANCH" == "origin/master" ]; then

        docker tag reactapp:latest atchayara/production:latest
	docker push atchayara/production:latest
else
    echo "Not on a deployable branch (dev or mastetestrrrr). Deployment aborted"
    exit 1
fi
