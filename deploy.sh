#!/bin/bash

docker-compose up -d

docker tag reactapp:latest atchayara/reactapp:dep


GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$GIT_BRANCH" = "dev" ]; then

        docker tag reactapp:dep atchayara/reactdev:devdeploy
	docker push dev/reactapp:dep

elif [ "$GIT_BRANCH" = "master" ]; then

	docker tag reactapp:dep atchayara/reactprod:proddeploy
	docker push production/reactapp:dep
else
    echo "Not on a deployable branch (dev or master). Deployment aborted."
    exit 1
fi
