#!/usr/bin/env bash

echo "Build the docker"

docker build . -f Dockerfile \
               --progress=plain \
               -t rkrispin/rstudio-customize:dev

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push rkrispin/rstudio-customize:dev
else
echo "Docker build failed"
fi
