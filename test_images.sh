#!/bin/bash

for cc in 8 10; do
  for py in 2.7 3.8; do
    docker build --build-arg GCC=$cc --build-arg PY=${py//.} . #--build-arg BRANCH=$(git rev-parse --abbrev-ref HEAD) .
  done
done
