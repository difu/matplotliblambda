FROM amazonlinux:2017.03

RUN yum -y install  \
    cmake \
    chrpath \
    gcc \
    git \
    python36 \
    python36-pip \
    python36-devel \
    wget \
    zip \
    && yum clean all

WORKDIR /tmp

RUN python3.6 -m pip install matplotlib -t . && rm -rf *dist-info

WORKDIR /lambda_root

COPY create_deployment.sh /usr/local/bin/
