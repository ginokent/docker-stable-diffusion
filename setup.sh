#!/bin/bash

dst_dir=./stable-diffusion-v1/stable-diffusion-v-1-4-original

if [[ ! -d "${dst_dir:?}" ]]; then
  if [[ -z "${HUGGINGFACE_USERNAME-}" ]]; then
    read -p 'Enter https://huggingface.co/ username: ' -r HUGGINGFACE_USERNAME
  fi

  if [[ -z "${HUGGINGFACE_TOKEN-}" ]]; then
    read -p 'Enter https://huggingface.co/settings/tokens token: ' -r -s HUGGINGFACE_TOKEN
    echo
  fi

  git clone "https://${HUGGINGFACE_USERNAME:?}:${HUGGINGFACE_TOKEN:?}@huggingface.co/CompVis/stable-diffusion-v-1-4-original" "${dst_dir:?}"
fi
