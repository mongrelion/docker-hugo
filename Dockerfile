FROM alpine:3.10.3

MAINTAINER Carlos León <mail@carlosleon.info>

ARG HUGO_VERSION=0.60.0

RUN apk update
RUN apk add openssl py2-pip

# Ensure the latest version of pip is installed
RUN pip install --upgrade pip

WORKDIR /tmp

RUN wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xvf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv ./hugo /usr/bin/hugo && \
    chmod +x /usr/bin/hugo && \
    rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz README.md LICENSE

# Install Pygments. Enables server-side syntax highlighting
RUN pip install Pygments

WORKDIR /usr/share/hugo

ENTRYPOINT ["/usr/bin/hugo"]
