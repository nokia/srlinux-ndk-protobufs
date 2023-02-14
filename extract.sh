#!/bin/bash

# Copyright 2020 Nokia
# Licensed under the BSD 3-Clause License.
# SPDX-License-Identifier: BSD-3-Clause

# this script extracts NDK protobuf files from srlinux public container image
# usage: bash extract.sh $ndkVersion
# example: bash extract.sh 0.1.1

set -e

if [ -z "$1" ]; then
    echo "ndk version is not set. usage: bash extract.sh <ndkVersion>."
    exit 1
fi

TMP_PROTO_DIR=/tmp/ndkprotos

NDK_VER=$1

# fix proto files to conform with pacakge/naming convention used when publishing Go/Py packages
sed -i -- 's|package srlinux.sdk;|package ndk;|g' ${TMP_PROTO_DIR}/*.proto
sed -i -- 's|option go_package = "nokia.com/srlinux/sdk/protos";|option go_package = "github.com/nokia/srlinux-ndk-go/ndk";|g' ${TMP_PROTO_DIR}/*.proto
sed -i -- 's|import "|import "ndk/|g' ${TMP_PROTO_DIR}/*.proto

# cleanup existing protos
rm -r ./ndk/*

# copy new proto files over
cp -a ${TMP_PROTO_DIR}/*.proto ./ndk
