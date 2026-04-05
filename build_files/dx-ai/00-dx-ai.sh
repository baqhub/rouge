#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Install nvidia-container-toolkit
# The repo is already present from the DX Docker CE installation
dnf -y install --enablerepo=nvidia-container-toolkit-experimental \
    nvidia-container-toolkit

# Enable CDI spec generation on boot
systemctl enable nvidia-ctk-cdi-generate.service

echo "::endgroup::"
