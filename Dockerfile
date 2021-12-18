# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.155.1/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version: bionic, focal
ARG BASE_IMG_VARIANT="11-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/java:${BASE_IMG_VARIANT}
# FROM eclipse-temurin:11

ARG BALLERINA_DEB_URL="https://dist.ballerina.io/downloads/swan-lake-beta6/ballerina-swan-lake-beta6.zip"
ARG BALLERINA_VSIX_URL="https://github.com/wso2/ballerina-plugin-vscode/releases/download/v2.1.1/WSO2.ballerina-2.1.1.vsix"
# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

RUN apt-get update \
    && apt-get install -y wget unzip \
    && rm -rf /var/lib/apt/lists/* \
    && wget ${BALLERINA_DEB_URL} -O /tmp/ballerina.zip \ 
    && wget ${BALLERINA_VSIX_URL} -O /tmp/ballerina.vsix \ 
    && unzip /tmp/ballerina.zip -d /usr/lib/ballerina \
    && mv /usr/lib/ballerina/*/* /usr/lib/ballerina \
    && rm /tmp/ballerina.zip \
    && echo export PATH=$PATH:/usr/lib/ballerina/bin >> /home/vscode/.bashrc
    
