#!/bin/bash -eE

echo "INFO: install dependencies..."

echo "deb [arch=amd64] https://packages.confluent.io/deb/5.5 stable main" >> /etc/apt/sources.list

apt-get update && apt-get install -y \
    librdkafka1 \
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

# This script downloads latest version but 1.45.2 was tested by TONLabs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y 
