#!/usr/bin/bash

set -xeou pipefail

echo "::group:: Copy Files"

# Copy Files to Image
rsync -rvK /ctx/system_files/dx/ /

mkdir -p /tmp/scripts/helpers
install -Dm0755 /ctx/build_files/shared/utils/ghcurl /tmp/scripts/helpers/ghcurl
export PATH="/tmp/scripts/helpers:$PATH"

echo "::endgroup::"

# Apply IP Forwarding before installing packages to prevent messing with LXC networking
sysctl -p

# Install Packages and set up DX
/ctx/build_files/dx/00-dx.sh

# dx specific tests
/ctx/build_files/dx/01-tests-dx.sh
