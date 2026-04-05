#!/usr/bin/bash

set -xeou pipefail

echo "::group:: Copy Files"

# Copy AI-specific system files
rsync -rvK /ctx/system_files/dx-ai/ /

echo "::endgroup::"

# Install nvidia-container-toolkit
/ctx/build_files/dx-ai/00-dx-ai.sh
