<p align=center><a href="https://learn.srlinux.dev"><img src=https://gitlab.com/rdodin/pics/-/wikis/uploads/00f61ff15f4f165c89174c46a5201820/srl-ndk-proto.svg?sanitize=true/></a></p>

[![Docs](https://img.shields.io/badge/Docs-learn.srlinux.dev-blue?style=flat-square&color=00c9ff&labelColor=bec8d2)](https://learn.srlinux.dev/ndk/)

---

The Nokia SR Linux [NetOps Development Kit (NDK)](https://learn.srlinux.dev/ndk/) allows operators to program high-performance, integrated agents that run alongside the Nokia Service Router Linux (SR Linux). This repository provides `.proto` files that define the gRPC APIs used with the NDK.

NDK protobufs are common across all SR Linux hardware platforms.

## Repository structure

The `main` branch of this repository contains only the documentation. To reveal the proto files for a given NDK release, select the matching tag in GitHub UI.

In addition to the proto source files, the repository contains the generated [NDK Protobuf documentation](https://rawcdn.githack.com/nokia/srlinux-ndk-protobufs/v0.2.0/doc/index.html) for each tagged release.

## Code generation

Protocol buffers support generated code in many languages - Java, Python, Objective-C, C++, Dart, Go, Ruby, C# with more languages to come.

Since NDK is defined with protocol buffers, SR Linux application developers can choose any supported language when developing their apps.

Currently, the Nokia SR Linux team maintains the following generated language bindings for NDK:

- [srlinux-ndk-go](https://github.com/nokia/srlinux-ndk-go) - Go bindings
- [srlinux-ndk-py](https://github.com/nokia/srlinux-ndk-py) - Python bindings

To generate NDK code in other languages, consult with the official [protocol buffers documentation](https://developers.google.com/protocol-buffers/docs/tutorials) for a given language.

## Download

There are several ways to download the proto files for a specific SR Linux release. The below examples are provided for NDK `0.1.0` version.

### Clone with git

With `git` it is possible to clone the protos for a specific release with the following command:

```
git clone -b v0.1.0 --depth 1 https://github.com/nokia/srlinux-ndk-protobufs
```

### Download archives

To download the proto files for a specific release in the `zip` or `tgz` containers, navigate to the GitHub [`tags`](https://github.com/nokia/srlinux-ndk-protobufs/tags) page, which contains the links to the archives.

If needed, the download link can be programmatically derived using the following rule:

**for zip**
`https://github.com/nokia/srlinux-ndk-protobufs/archive/tags/` + `$tag` + `.zip`

**for tar.gz**
`https://github.com/nokia/srlinux-ndk-protobufs/archive/tags/` + `$tag` + `.tar.gz`
