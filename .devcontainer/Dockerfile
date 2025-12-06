FROM mcr.microsoft.com/devcontainers/dotnet:1-9.0-bookworm

# .NET 9 SDK is already installed in this base image

# Install additional tools including GitHub CLI
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    postgresql-client \
    redis-tools \
    curl \
    wget \
    jq \
    vim \
    nano \
    tree \
    htop \
    gnupg \
    && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install -y gh \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Add dotnet tools to PATH first
ENV PATH="${PATH}:/root/.dotnet/tools:/home/vscode/.dotnet/tools"

# Install dotnet tools globally as vscode user (will be installed during postCreate instead)
# RUN dotnet tool install --global dotnet-ef \
#     && dotnet tool install --global dotnet-format

# Set up workspace
WORKDIR /workspace

# Configure Git to trust the workspace directory
RUN git config --global --add safe.directory /workspace
