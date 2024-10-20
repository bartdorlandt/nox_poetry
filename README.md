# pythons + nox, poetry and uv support

## Purpose
A docker image with the currently supported python versions along with nox, poetry and uv.

## Build a new release
Re-running the pipeline will generate a new release for amd64 and arm64 platforms.

### Build it locally
To build the image locally, you can run:

    task build

This builds the image with the tag `pythons_nox_poetry_uv:latest` for the platform it is run on.

To build it with a different version run:

    task VERSION=test build

Type `task` to see some different options.

## Usage example
To run your tests locally, where you have a noxfile in the src directory, you can run:

    docker run --rm -it -v $(pwd):/src bartdorlandt/pythons_nox_poetry_uv:latest nox -f src/noxfile.py
