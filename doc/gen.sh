#!/bin/bash

set -e

if [ -z "$1" ]
  then
    echo "No NDK version provided. Usage: bash doc/gen.sh 0.1.0"
    exit 1
fi

# generate proto docs
docker run --rm \
  -v $(pwd)/doc:/out \
  -v $(pwd):/protos \
  --entrypoint '' \
  pseudomuto/protoc-gen-doc \
  bash -c "protoc -I /protos --doc_out=/out /protos/ndk/*.proto --doc_opt=/out/doc.tmpl,index.html"

# change the NDK version accordingly
sed -i "s|__NDK_VER__|$1|g" ./doc/index.html

# change link
sed -i "s|/v.\+/|/v$1/|g" README.md