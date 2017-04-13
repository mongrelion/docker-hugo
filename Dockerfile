FROM alpine:3.5

MAINTAINER Carlos León <mail@carlosleon.info>

ARG HUGO_VERSION

RUN apk update
RUN apk add openssl

WORKDIR /tmp

RUN wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xvf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo && \
    chmod +x /usr/bin/hugo && \
    rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm -r hugo_${HUGO_VERSION}_linux_amd64

WORKDIR /usr/share/hugo

ENTRYPOINT ["/usr/bin/hugo"]
