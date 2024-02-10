#!/bin/bash

docker-compose up -d


docker tag reactapp:latest atchayara/reactapp:dep

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$GIT_BRANCH" = "dev" ]; then

	docker push atchayara/dev:tagname

elif [ "$GIT_BRANCH" = "master" ]; then

	docker push atchayara/production:tagname
else
    echo "Not on a deployable branch (dev or production). Deployment aborted."
    exit 1
fi
