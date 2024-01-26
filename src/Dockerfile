# docker run -p 4420 -it -e TGT_UUID=$(uuid) -e VDEV_UUID=$(uuid) -e DEV_SIZE=$((10*1024*1024)) -v $PWD/store:/store:Z niova
FROM debian:12.4-slim
RUN apt-get update

RUN apt-get install -y python3-minimal
RUN apt-get install -y libnuma1 libfuse3-3 libaio1 libasan8

RUN apt-get install -y liburing-dev rsync

# where the nisd data is kept
VOLUME /store

WORKDIR /niova
COPY . .

RUN rsync /niova/root/ / -ap

ENV PYTHONPATH=/usr/lib/python3.11/site-packages/
CMD /niova/run_client_server.sh
EXPOSE 4420
