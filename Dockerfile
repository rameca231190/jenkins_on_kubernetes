FROM jenkins/jenkins:latest

EXPOSE 8080 50000

USER root

# Install prerequisites for Docker
# RUN add-apt-repository ppa:duh/golang
RUN apt-get update && apt-get install -y golang

# ENV DOCKER_VERSION=docker-ce_17.03.0~ce-0~ubuntu-trusty_amd64.deb
ENV KUBERNETES_VERSION=v1.12.0

# Set up Docker
# RUN wget https://download.docker.com/linux/ubuntu/dists/trusty/pool/stable/amd64/$DOCKER_VERSION
# RUN dpkg -i $DOCKER_VERSION

# Set up Kubernetes
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

