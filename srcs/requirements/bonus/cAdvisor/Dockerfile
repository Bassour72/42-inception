FROM alpine:3.19

RUN apk add --no-cache \
    libc6-compat \
    device-mapper \
    findutils \
    ndctl \
    thin-provisioning-tools \
    zfs \
    curl

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 \
    -o /usr/bin/cadvisor \
    && chmod +x /usr/bin/cadvisor

EXPOSE 8080

ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr", "-docker=unix:///var/run/docker.sock"]