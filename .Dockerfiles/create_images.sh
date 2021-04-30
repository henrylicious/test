#!/bin/bash

for cc in 8 10; do
  for py in 2.7 3.8; do
    docker build -t dendes/build-${cc}-${py//.}:latest --build-arg GCC=$cc --build-arg PY=$py -f .Dockerfiles/Dockerfile .
  done
done
