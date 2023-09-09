FROM --platform=linux/amd64 ghcr.io/nhs-england-tools/github-runner-image:${yyyy}${mm}${dd}-${hash}-base

RUN set -eux && \
    \
    # Fetch the latest version of the package list
    apt update --yes && \
    \
    # Install development tools
    apt install --yes \
        gh
