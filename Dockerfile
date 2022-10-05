# Set base image to build upon
FROM python:3.10-slim

# Set arg and env
ARG VERSION
ARG UID=1000
ARG GID=1000
ARG USER=jenkins
ARG GROUP=jenkins

# Add jenkins user and group
RUN groupadd -g ${GID} ${GROUP} && \
    useradd -u ${UID} -g ${GID} -m -s /bin/bash ${USER}

# Set labels to identify image
LABEL vendor="Ghostery GmbH" \
      maintainer="chrmod@ghostery.com" \
      version=${VERSION}

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      build-essential \
      libffi-dev \
      ruby-sass \
    && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /var/cache/apt/*.bin

# Copy application python requirements
COPY requirements-dev.txt /home/jenkins/

# Install python dependencies
RUN pip install -r /home/jenkins/requirements-dev.txt
