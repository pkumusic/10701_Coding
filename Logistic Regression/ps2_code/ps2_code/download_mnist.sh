#!/bin/bash
set -ux

mkdir -p data

for name in train-images-idx3-ubyte \
            train-labels-idx1-ubyte \
            t10k-images-idx3-ubyte \
            t10k-labels-idx1-ubyte; do
  curl http://yann.lecun.com/exdb/mnist/$name.gz | gunzip > data/$name
done
