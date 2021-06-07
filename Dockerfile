# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.155.1/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version: bionic, focal
ARG BASE_IMG_VARIANT="ubuntu"
FROM mcr.microsoft.com/vscode/devcontainers/base:${BASE_IMG_VARIANT}

ARG BALLERINA_DEB_URL=""
ARG BALLERINA_VSIX_URL=""
# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

RUN wget ${BALLERINA_DEB_URL} -O /tmp/ballerina-linux-installer.deb \ 
    && wget ${BALLERINA_VSIX_URL} -O /tmp/ballerina.vsix \ 
    && dpkg -i /tmp/ballerina-linux-installer.deb \
    && rm /tmp/ballerina-linux-installer.deb \
    && ln -s /usr/lib/ballerina/dependencies/jdk-11.0.8+10-jre/bin/java /usr/bin/java
