# pythons + nox and poetry support 

## Purpose
A docker image with the currently supported python versions along with nox and poetry. 

## Build a new release
Re-running the pipeline will generate a new release. 

Within the pipeline the `make build` is issued, that will create a new release for the 'linux/amd64' platform, version tag set to latest and the image name python_nox_poetry. 

Each of these can be overwritten with the `-e` flag. 

e.g.

    make build -e VERSION=test -e PLATFORM=linux/arm64



## Usage
To run your tests locally, you could do:

    docker run --rm -it -v $(pwd):/src bartdorlandt/nox_poetry:latest nox -f src/noxfile.py
