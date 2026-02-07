# Dockerfile
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install core network testing tools
RUN apt-get update && apt-get install -y \
    nmap \
    tcpdump \
    netcat-openbsd \
    iputils-ping \
    dnsutils \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create working directories
RUN mkdir -p /workspace/logs /workspace/scripts /workspace/config

# Set working directory
WORKDIR /workspace

# Drop into bash shell
CMD ["/bin/bash"]
