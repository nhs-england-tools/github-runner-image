include ./scripts/init.mk
include ./scripts/test.mk

DOCKER_IMAGE := ghcr.io/nhs-england-tools/github-runner-image
DOCKER_TITLE := "GitHub Runner Image"

# ==============================================================================

build: # Build Docker images
	make build-image name="base"
	make build-image name="rt"

publish: # Publish Docker images
	make publish-image name="base"
	make publish-image name="rt"

# ==============================================================================

build-image: # Build Docker image - optional: name=[image name to build, default is 'base']
	dir=infrastructure/images/$(or ${name}, "base") make docker-build

publish-image: # Publish Docker image - optional: name=[image name to publish, default is 'base']
	dir=infrastructure/images/$(or ${name}, "base") make docker-push

# ==============================================================================

.SILENT: \
	build \
	build-image \
	publish \
	publish-image \
