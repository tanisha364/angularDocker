#!/bin/bash

# Ensure docker-compose is installed
#DOCKER_COMPOSE_PATH=$(command -v docker-compose)
DOCKER_COMPOSE_PATH=$( docker compose version)
if [ -z "$DOCKER_COMPOSE_PATH" ]; then
    echo "Error: docker-compose is not installed. Please install it first."
    exit 1
fi

# Specify the full path to docker-compose.yml
DOCKER_COMPOSE_YML_PATH="/home/c/tanisha/First/docker-compose.yml"

# Run docker-compose using the full paths
docker compose -f "$DOCKER_COMPOSE_YML_PATH" up
