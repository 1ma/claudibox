#!/usr/bin/env bash

set -euo pipefail

set +x
incus launch images:debian/13/cloud claudibox \
  --config=boot.autostart=false \
  --config=cloud-init.user-data="$(< cloud-init.yaml)"
set -x

incus exec claudibox -- cloud-init status --wait

incus config set claudibox raw.idmap="both 1000 1000"

incus restart claudibox

incus config device add claudibox workspace disk \
  source=$HOME/workspace \
  path=/home/claudi/workspace
