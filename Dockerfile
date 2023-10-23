FROM thekevjames/nox

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/GMT
RUN apt-get update -qy && \
    apt-get install -qy python3.12 \
        python3.12-dev && \
    curl -fsSo /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3.12 /tmp/get-pip.py && \
    python3.12 -m pip install --no-cache-dir --upgrade pip && \
    rm -rf /var/cache/apt/lists && \
    rm /tmp/get-pip.py && \
    pip install --no-cache-dir poetry nox-poetry
