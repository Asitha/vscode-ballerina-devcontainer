# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.155.1/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version: bionic, focal
ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT} as stage1

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

RUN wget https://dist.ballerina.io/downloads/swan-lake-alpha1/ballerina-linux-installer-x64-swan-lake-alpha1.deb \ 
    && wget https://github.com/ballerina-platform/plugin-vscode/releases/download/vswan-lake-alpha1/ballerina-swan-lake-alpha1.vsix -P /tmp/ \ 
    && dpkg -i ./ballerina-linux-installer-x64-swan-lake-alpha1.deb \
    && rm ./ballerina-linux-installer-x64-swan-lake-alpha1.deb \
    && ln -s /usr/lib/ballerina/dependencies/jdk-11.0.8+10-jre/bin/java /usr/bin/java
