#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=ibrahimimg/ml-microservice-api:v1.0.0

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag ml-microservice-api:latest $dockerpath
docker login

# Step 3:
# Push image to a docker repository
docker push $dockerpath
