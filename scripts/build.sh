#!/bin/bash

source_loading () {
  source scripts/env.sh
}

script_build_image () {
  # cargando scripts
  source_loading

  # cargando variables globales
  script_env_global

  # debug
  export DOCKER_BUILDKIT=0

  # ejecutando proceso
  docker build -t ${dockerhubUser}/${appName}:latest -f docker/Dockerfile.${img} .
}

"$@"