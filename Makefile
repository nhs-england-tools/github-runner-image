include ./scripts/init.mk
include ./scripts/test.mk

DOCKER_IMAGE := ghcr.io/nhs-england-tools/github-runner-image
DOCKER_TITLE := "GitHub Runner Image"

build: # Build Docker image - optional: name=[image name to build, default is 'base']
	dir=infrastructure/images/$(or ${name}, "base") make docker-build

publish: # Publish Docker image - optional: name=[image name to publish, default is 'base']
	dir=infrastructure/images/$(or ${name}, "base") make docker-push

.SILENT: \
	build \
	publish \
