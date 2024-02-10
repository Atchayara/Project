#!/bin/bash

docker-compose up -d


docker tag reactapp:latest atchayara/reactapp:dep

#pushing an image to dockerhub:
docker push atchayara/reactapp:dep

echo "the image has been pushed to docker hub"
