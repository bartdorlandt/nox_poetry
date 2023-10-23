# Nox with poetry support 

Based on the docker images provided by https://hub.docker.com/r/thekevjames/nox this repo adds support for poetry and nox-poetry. 


To run your tests locally, you could do:

    docker run --rm -it -v $(pwd):/src bartdorlandt/nox_poetry:latest nox -f src/noxfile.py
