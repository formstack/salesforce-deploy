FROM mcr.microsoft.com/dotnet/core/sdk:2.2-bionic AS build
MAINTAINER Balinder Singh <bsbhinder@outlook.com>
RUN apt-get update \
    && apt-get install -y bash openjdk-8-jdk jq ant nodejs npm
RUN echo "Node version:"
RUN node -v
RUN npm install -g npm
RUN npm -v
RUN npm install -g grunt-cli
RUN npm install -g sfdx-cli
RUN echo "DOTNET version:"
RUN dotnet --version

RUN apt-get install -y curl tar firefox unzip xvfb \
&& rm -rf /var/lib/apt/lists/*

RUN firefox --version
RUN \
# Create firefox + xvfb runner (it is in-memory display server to run firefox in headless mode)
mv /usr/bin/firefox /usr/bin/firefox-origin && \
echo $'#!/usr/bin/env sh\n\
Xvfb :0 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset & \n\
DISPLAY=:0.0 firefox-origin $@ \n\
killall Xvfb' > /usr/bin/firefox && \
chmod +x /usr/bin/firefox

# geckodriver (it is the driver for firefox)
RUN curl https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz -O -L && ls && \
	tar -zxvf geckodriver-v0.26.0-linux64.tar.gz && \
	mv ./geckodriver /usr/local/bin/ && \
	chmod a+x /usr/local/bin/geckodriver

ENV ANT_HOME /usr/share/java/apache-ant
ENV PATH $PATH:$ANT_HOME/bin