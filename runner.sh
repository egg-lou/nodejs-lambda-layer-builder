#!/bin/bash

container_name=nodejs_docker
docker_image=nodejs_builder_image

# Build the Docker image
docker build . -t "$docker_image"

# Run the container in detached mode
docker run -td --name="$container_name" "$docker_image"

# Copy the setup.sh script to the container
docker cp ./setup.sh "$container_name":/

# Execute the setup.sh script inside the container
docker exec -i "$container_name" bash /setup.sh

# Copy the nodejs.zip file from the container to the current directory
# Copy the nodejs.zip file from the container to the current directory
docker cp "$container_name":/app/node_modules.zip node_modules.zip

# Stop and remove the container
docker stop "$container_name"
docker rm "$container_name"