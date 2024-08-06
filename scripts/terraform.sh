#!/bin/bash

source_loading () {
  source scripts/env.sh
}

script_terraform_init () {
  # cargando scripts
  source_loading

  # cargando variables globales
  script_env_global

  # cargando variables docker
  script_env_docker

  # depurando
  rm -rf /tmp/terraformrc
  rm -rf /tmp/backend.hcl

  # creando terraformrc
  cat <<EOF > /tmp/terraformrc
credentials "app.terraform.io" {
  token = "${TF_TOKEN}"
}
EOF

  # creando backend.hcl
  cat <<EOF > /tmp/backend.hcl
workspaces { name = "${appName}" }
hostname     = "app.terraform.io"
organization = "${TF_ORGANIZATION}"
EOF
}

"$@"