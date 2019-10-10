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
RUN apt-get update && apt-get install -y ruby-sass build-essential wget

# Copy application python requirements
COPY requirements-dev.txt /home/jenkins/

# Install python dependencies
RUN pip install -r /home/jenkins/requirements-dev.txt

USER ${USER}
RUN cd /home/jenkins && \
  wget https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.xz && \
  tar xvf node-v10.16.3-linux-x64.tar.xz
ENV PATH="/home/jenkins/node-v10.16.3-linux-x64/bin/:${PATH}"
RUN npm install -g electron@1.8.4 orca
