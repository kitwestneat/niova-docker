# see build_niova_img.sh to run
FROM debian:12.4-slim
RUN apt-get update
RUN apt-get install -y make autoconf automake gcc pkgconf libtool uuid-dev zlib1g-dev liblz4-dev librocksdb-dev
RUN apt-get install -y liburing-dev libreadline-dev libfuse3-dev python3-minimal procps meson python3-pip
RUN apt-get install -y python3-pyelftools libnuma-dev libssl-dev libcunit1-dev libaio-dev

# source dirs
VOLUME /niova/build

# where the build artifacts are installed
VOLUME /niova/root

WORKDIR /niova/build

CMD bash ./build.sh
EXPOSE 4420
