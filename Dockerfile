FROM golang:1.18.1-bullseye AS build

WORKDIR /build

COPY . .

RUN apt update && \
    apt install -y libgpgme-dev libseccomp-dev libbtrfs-dev && \
    echo "building cri-o..." && \
    make BUILDTAGS='seccomp exclude_graphdriver_devicemapper containers_image_ostree_stub apparmor' bin/crio

FROM scratch

COPY --from=build /build/bin/crio /
