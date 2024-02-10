#!/bin/bash


IMAGE_NAME="reactapp"
TAG="latest"

DOCKERFILE="Dockerfile"

docker build -t "${IMAGE_NAME}:${TAG}" -f "${DOCKERFILE}" .



