FROM alpine:3.22

RUN apk add --no-cache \
    libc6-compat \
    device-mapper \
    findutils \
    ndctl \
    thin-provisioning-tools \
    zfs \
    curl \
    bash

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.55.0/cadvisor-v0.55.0-linux-amd64 \
    -o /usr/bin/cadvisor \
    && chmod +x /usr/bin/cadvisor


COPY tools/entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh

COPY tools/healthcheck.sh /usr/bin/healthcheck.sh
RUN chmod +x /usr/bin/healthcheck.sh

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
CMD /usr/bin/healthcheck.sh

# Use entrypoint wrapper
ENTRYPOINT ["/usr/bin/entrypoint.sh"]


