# This file is for you! Edit it to implement your own hooks (make targets) into
# the project as automated steps to be executed on locally and in the CD pipeline.

include ./scripts/init.mk
include ./scripts/test.mk

# Example targets are: dependencies, build, publish, deploy, clean, etc.

DOCKER_IMAGE := gcr.io/nhs-england-tools/github-runner-image
DOCKER_TITLE := "GitHub Runner Image"

build: # Build the project artefact
	make docker-build

publish: # Publish the project artefact
	source ./scripts/docker/docker.lib.sh
	docker-push

.SILENT: \
	build \
	publish \
