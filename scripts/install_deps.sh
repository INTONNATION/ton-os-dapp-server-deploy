#!/bin/bash -eE

echo "INFO: install dependencies..."

wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.6_amd64.deb

apt-get update && apt-get install -y \
    ./libssl1.0.0_1.0.2n-1ubuntu5.6_amd64.deb \
    librdkafka1 \
    librdkafka++1 \
    librdkafka-dev \
    unzip \
    curl \
    wget \
    gnupg2 \
    gpg \
    tar \
    cmake \
    build-essential \
    pkg-config \
    libssl-dev \
    libtool \
    m4 \
    automake \
    clang \
    git \
    jq

echo "deb [arch=amd64] https://packages.confluent.io/deb/6.1 stable main" >> /etc/apt/sources.list
apt-get update && apt-get install -y \
    librdkafka-dev

# This script downloads latest version but 1.45.2 was tested by TONLabs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y 
