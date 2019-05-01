#Based upon John Vester's johnjvester/docker-salesforce image on hub.docker.com
FROM alpine
MAINTAINER Balinder Singh <bsbhinder@outlook.com>
RUN apk update
RUN apk add bash
RUN apk add openjdk8
RUN apk add jq
RUN apk add --update nodejs npm
RUN npm install -g grunt-cli
RUN npm install -g sfdx-cli
RUN apk add apache-ant --update-cache \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
	--allow-untrusted
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/curl"]

ENV ANT_HOME /usr/share/java/apache-ant
ENV PATH $PATH:$ANT_HOME/bin
