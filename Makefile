VERSION := latest
IMAGE := python_nox_poetry
PLATFORM := linux/amd64

build:
	docker buildx build -f Dockerfile -t ${IMAGE}:${VERSION} --platform ${PLATFORM} .

run:
	docker run --rm -it ${IMAGE}:${VERSION} /bin/bash
