FROM --platform=linux/amd64 ubuntu:22.04@sha256:b492494d8e0113c4ad3fe4528a4b5ff89faa5331f7d52c5c138196f69ce176a6

ENV \
    # SEE: https://docs.docker.com/release-notes/
    DOCKER_VERSION=24.0.6 \
    DOCKER_COMPOSE_VERSION=v2.21.0 \
    DOCKER_BUILDX_VERSION=v0.11.2 \
    # SEE: https://nodejs.org/
    NODEJS_VERSION=18

RUN set -eux && \
    \
    # Fetch the latest version of the package list
    apt update --yes && \
    \
    # Install system dependencies
    apt install --yes \
        binutils \
        ca-certificates \
        coreutils \
        curl \
        gnupg \
        gzip \
        openssl \
        tzdata \
        wget \
        xz-utils \
        zip \
    && \
    # Install development tools
    apt install --yes \
        gh \
        git \
        git-lfs \
        jq \
        make \
    && \
    # Install docker
    wget -O docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" && \
    tar --extract --file docker.tgz --strip-components 1 --directory /usr/local/bin && \
    rm docker.tgz && \
    # Install docker compose
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    # Install docker buildx
    wget -O docker-buildx "https://github.com/docker/buildx/releases/download/${DOCKER_BUILDX_VERSION}/buildx-${DOCKER_BUILDX_VERSION}.linux-amd64" && \
    mkdir -p /usr/local/lib/docker/cli-plugins && \
    chmod +x docker-buildx && \
    mv docker-buildx /usr/local/lib/docker/cli-plugins/docker-buildx && \
    # Install nodejs
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODEJS_VERSION}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt update --yes && \
    apt install --yes nodejs && \
    \
    # Cleanup
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/* && \
    \
    # Print versions
    dockerd --version && \
    docker --version && \
    docker-compose --version && \
    docker buildx version && \
    node --version

RUN set -eux && \
    \
    git config --global --add safe.directory '*'
