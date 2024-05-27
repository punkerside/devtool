#!/bin/bash

script_env_global () {
  # variables globales
  project="titan"
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

"$@"