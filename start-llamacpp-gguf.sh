#!/usr/bin/env bash

cd /llama.cpp
./server --host 0.0.0.0 --port 8080 -ngl 999 --mlock -m /model.gguf -c $LLAMA_CPP_CTX_LEN
