FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/GMT
COPY requirements.txt /
# https://devguide.python.org/#status-of-python-branches
RUN apt-get update -qy && \
    apt-get install -qy --no-install-recommends \
        ca-certificates \
        curl \
        gnupg2 && \
    . /etc/os-release && \
    echo "deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu ${UBUNTU_CODENAME} main" > /etc/apt/sources.list.d/deadsnakes.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 && \
    apt-get update -qy && \
    apt-get install -qy --no-install-recommends \
        git \
        openssh-client \
        python3 \
        python3-dev \
        python3.9 \
        python3.9-distutils \
        python3.9-dev \
        python3.10 \
        python3.10-dev \
        python3.11 \
        python3.11-dev \
        python3.12 \
        python3.12-dev && \
    curl -fsSo /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3 /tmp/get-pip.py && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    python3.9 /tmp/get-pip.py && \
    python3.9 -m pip install --no-cache-dir --upgrade pip && \
    python3.10 /tmp/get-pip.py && \
    python3.10 -m pip install --no-cache-dir --upgrade pip && \
    python3.11 /tmp/get-pip.py && \
    python3.11 -m pip install --no-cache-dir --upgrade pip && \
    python3.12 /tmp/get-pip.py && \
    python3.12 -m pip install --no-cache-dir --upgrade pip && \
    rm /tmp/get-pip.py && \
    python3 -m pip install --no-cache-dir -r /requirements.txt && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/cache/apt/lists && \
    apt-get autoclean && apt-get clean