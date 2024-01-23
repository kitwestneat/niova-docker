FROM alpine:3.19
WORKDIR /niova
COPY . .
RUN build.sh
CMD run_client_server.sh
EXPOSE 4420
