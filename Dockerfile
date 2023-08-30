FROM ubuntu:latest

RUN set -eux; \
    \
    # Install dependencies
    apt update && \
    apt install -y \
        ca-certificates \
        openssh-client \
        wget \
        curl \
        iptables \
        supervisor \
    && \
    rm -rf /var/lib/apt/list/*

# SEE: https://docs.docker.com/release-notes/
ENV \
    DOCKER_CHANNEL=stable \
    DOCKER_VERSION=24.0.5 \
    DOCKER_COMPOSE_VERSION=v2.20.3 \
    BUILDX_VERSION=v0.11.2 \
    DEBUG=false

RUN set -eux; \
    \
    dockerArch="x86_64" && \
    buildx_arch="linux-amd64" && \
    # Install docker
    wget -O docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/${dockerArch}/docker-${DOCKER_VERSION}.tgz" && \
    tar --extract --file docker.tgz --strip-components 1 --directory /usr/local/bin && \
    rm docker.tgz && \
    # Install docker-compose
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    # Install buildx
    wget -O docker-buildx "https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.${buildx_arch}" && \
    mkdir -p /usr/local/lib/docker/cli-plugins && \
    chmod +x docker-buildx && \
    mv docker-buildx /usr/local/lib/docker/cli-plugins/docker-buildx && \
    \
    dockerd --version && \
    docker --version && \
    docker-compose --version && \
    docker buildx version
