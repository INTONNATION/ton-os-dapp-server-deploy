#!/bin/bash -eE

echo "INFO: install dependencies..."

apt-get update && apt-get install -y \
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

curl https://packages.confluent.io/deb/5.5/archive.key | apt-key add
echo "deb [arch=amd64] https://packages.confluent.io/deb/5.5 stable main" >> /etc/apt/sources.list
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.6_amd64.deb
apt-get update && apt-get install -y \
    ./libssl1.0.0_1.0.2n-1ubuntu5.6_amd64.deb \
    librdkafka1 \
    librdkafka++1 \
    librdkafka-dev

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y 
