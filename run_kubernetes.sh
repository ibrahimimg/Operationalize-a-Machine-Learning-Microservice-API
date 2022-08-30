#!/usr/bin/env bash

# This run docker with kubernetes

# Step 1:
# This is your Docker ID/path
dockerpath=ibrahimimg/ml-microservice-api:v1.0.0
service=ml-microservice-api
# Step 2
# Run the Docker Hub container with kubernetes
# kubectl create deploy ml-microservice-api --image=$dockerpath
kubectl run $service --image=$dockerpath --port=80 # --generator=run/v1
# Step 3:
# List kubernetes pods
kubectl get pods
# save the pod name in var
pod=$(kubectl get pods --sort-by=.metadata.creationTimestamp -o jsonpath="{.items[0].metadata.name}")

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/$pod --address 0.0.0.0 8000:80
