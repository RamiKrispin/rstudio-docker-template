#!/usr/bin/env bash
IMAGE_NAME=$1

echo "Build the docker"

docker build . -f Dockerfile \
               --progress=plain \
               -t $IMAGE_NAME

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push $IMAGE_NAME
else
echo "Docker build failed"
fi
