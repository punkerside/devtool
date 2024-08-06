#!/bin/bash

script_env_global () {
  # variables globales
  project="falcon"
  repoType="microservice"
  service="user"
  env="dev"
  export project="${project}"
  export repoType="${repoType}"
  export service="${service}"
  export env="${env}"

  # nombre de aplicacion
  appName="${project}-${env}-${service}"

  # variables docker
  dockerhubUser="punkerside"
  export dockerhubUser=${dockerhubUser}
}

script_env_docker () {
  docker_uid=$(id -u)
  docker_gid=$(id -g)
  docker_user=$(whoami)
  export docker_uid="${docker_uid}"
  export docker_gid="${docker_gid}"
  export docker_user="${docker_user}"
  echo "${docker_user}:x:${docker_uid}:${docker_gid}::/app:/sbin/nologin" > passwd
}

"$@"