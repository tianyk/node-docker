## Build

```bash
for arch in 'amd64' 'arm64'
do
    docker buildx build \
        --platform linux/${arch} \
        --load -t doog/node:14-alpine-$arch \
        -f Dockerfile.node14 .
    
    docker buildx build \
        --platform linux/${arch} \
        --load -t doog/node:16-alpine-$arch \
        -f Dockerfile.node16 .
done
```