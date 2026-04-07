#!/usr/bin/bash

source /usr/lib/ublue/setup-services/libsetup.sh

version-script flatpaks privileged 2 || exit 0

set -x

# Ensure flatpak remotes are configured
flatpak remote-add --system --if-not-exists flatsoftware https://flat.software/repo.flatpakrepo
flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
