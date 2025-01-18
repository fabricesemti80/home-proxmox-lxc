FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install required packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    python3-pip \
    software-properties-common \
    curl \
    gnupg \
    lsb-release

# Install Ansible
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install ansible ansible-lint

# Install Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update \
    && apt-get install -y terraform

# Clean up
RUN apt-get update && apt-get install -y direnv

RUN apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace