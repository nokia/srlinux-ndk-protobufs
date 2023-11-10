#!/bin/bash

# Copyright 2020 Nokia
# Licensed under the BSD 3-Clause License.
# SPDX-License-Identifier: BSD-3-Clause

# this script extracts NDK protobuf files from srlinux public container image
# usage: bash extract.sh $srlVersion
# example: bash extract.sh 23.10.1

set -e

if [ -z "$1" ]; then
    echo "srlinux version is not set. usage: bash extract.sh <srlVersion>. Example: bash extract.sh 23.10.1"
    exit 1
fi

SRL_VER=$1

TMP_PROTO_DIR=/tmp/ndkprotos
# if pull is not successfull, assume that image is present locally
docker pull ghcr.io/nokia/srlinux:$1 || echo "using local image"
id=$(docker create ghcr.io/nokia/srlinux:$SRL_VER foo)
# remove prev yang files
rm -rf $TMP_PROTO_DIR
mkdir -p $TMP_PROTO_DIR
docker cp $id:/opt/srlinux/protos/ndk/. $TMP_PROTO_DIR


# fix proto files to conform with pacakge/naming convention used when publishing Go/Py packages
sed -i -- 's|option go_package = "nokia.com/srlinux/sdk/protos";|option go_package = "github.com/nokia/srlinux-ndk-go/ndk";|g' ${TMP_PROTO_DIR}/*.proto
sed -i -- 's|import "|import "ndk/|g' ${TMP_PROTO_DIR}/*.proto

# cleanup existing protos
rm -r ./ndk/*

# copy new proto files over
cp -a ${TMP_PROTO_DIR}/*.proto ./ndk
