#!/usr/bin/env bash

# $1 = GGUF_URL eg. https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF/resolve/main/mistral-7b-instruct-v0.1.Q5_K_M.gguf
# $2 = MODEL_NAME eg. mistral-7b-instruct-v0.1
# $3 = QUANT eg. Q5_K_M

# Build image
docker build --build-arg GGUF_URL=$1 --build-arg MODEL_NAME=$2 --file Dockerfile.llamacpp-gguf .

# Upload to GHCR
echo $GHCR_PAT | docker login ghcr.io -u CyberDie22 --password-stdin
docker push ghcr.io/CyberDie22/llamacpp-gguf-$MODEL_NAME:$QUANT
