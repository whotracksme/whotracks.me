# Set base image to build upon
FROM python:3.6-slim

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
LABEL vendor="Cliqz GmbH" \
      maintainer="sam@cliqz.com" \
      version=${VERSION}

# install sass
RUN apt-get update && apt-get install -y ruby-sass build-essential

# Copy application python requirements
COPY requirements-dev.txt /home/jenkins/

# Install python dependencies
RUN pip install -r /home/jenkins/requirements-dev.txt
