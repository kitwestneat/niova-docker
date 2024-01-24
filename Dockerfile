FROM debian:12.4-slim
RUN apt-get update
RUN apt-get install -y make autoconf automake gcc pkgconf libtool uuid-dev zlib1g-dev liblz4-dev librocksdb-dev
RUN apt-get install -y liburing-dev libreadline-dev libfuse3-dev python3-minimal procps meson python3-pip
RUN apt-get install -y python3-pyelftools libnuma-dev libssl-dev libcunit1-dev libaio-dev

WORKDIR /niova
COPY . .

RUN ./build.sh
CMD run_client_server.sh
EXPOSE 4420
