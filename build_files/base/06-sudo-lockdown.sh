#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -ouex pipefail

# Rouge sudo lockdown.
#
# Goal: a wheel user can run a small set of system-maintenance commands
# (system updates, rollbacks, system flatpak installs) and nothing else.
# Everything else — including shells, file copies, podman, mount, etc. —
# requires the actual root password (emergency console only).
#
# sudoers has no general "deny" semantics; we have to remove the broad
# %wheel ALL=(ALL) ALL grant from /etc/sudoers, then add an allowlist
# in /etc/sudoers.d/.

# Comment out any active %wheel rule in /etc/sudoers.
sed -i 's/^%wheel/# %wheel/' /etc/sudoers

# Install the restricted policy.
install -m 0440 -o root -g root /dev/stdin /etc/sudoers.d/zz-rouge-lockdown <<'EOF'
# Rouge lockdown: only allow specific maintenance commands via sudo.
# See build_files/base/06-sudo-lockdown.sh for the rationale.

Cmnd_Alias ROUGE_MAINT = \
    /usr/bin/bootc upgrade, \
    /usr/bin/bootc rollback, \
    /usr/bin/bootc status, \
    /usr/bin/rpm-ostree rollback, \
    /usr/bin/rpm-ostree status, \
    /usr/bin/uupd, \
    /usr/bin/flatpak install *, \
    /usr/bin/flatpak update, \
    /usr/bin/flatpak update *, \
    /usr/bin/flatpak uninstall *

%wheel ALL=(root) ROUGE_MAINT
EOF

# Validate the resulting sudoers configuration parses cleanly.
visudo -c

echo "::endgroup::"
