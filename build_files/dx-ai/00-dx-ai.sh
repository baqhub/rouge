#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Add NVIDIA container toolkit repo and install
dnf config-manager addrepo --from-repofile=https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/nvidia-container-toolkit.repo
dnf -y install --enablerepo=nvidia-container-toolkit-experimental \
    nvidia-container-toolkit

# Enable CDI spec generation on boot
systemctl enable nvidia-ctk-cdi-generate.service

echo "::endgroup::"
