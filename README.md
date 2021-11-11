# Protobuf files for Nokia SR Linux NDK
This branch contains source `.proto` files that define SR Linux NDK services.

The NDK services auto-generated documentation is [provided within this repository](https://raw.githack.com/nokia/srlinux-ndk-protobufs/v21.6.2/doc/index.html).

Documentation is generated out of the source protobufs with the following command:

```bash
docker run --rm \
  -v $(pwd)/doc:/out \
  -v $(pwd):/protos \
  --entrypoint '' \
  pseudomuto/protoc-gen-doc \
  bash -c "protoc -I /protos --doc_out=/out /protos/ndk/*.proto --doc_opt=/out/doc.tmpl,index.html"
```