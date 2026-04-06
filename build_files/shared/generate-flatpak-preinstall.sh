#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -eoux pipefail

PREINSTALL_DIR="/usr/share/flatpak/preinstall.d"
PREINSTALL_FILE="${PREINSTALL_DIR}/rouge.preinstall"
mkdir -p "${PREINSTALL_DIR}"

generate_entries() {
  local list="$1"
  local is_runtime="$2"
  while IFS= read -r app; do
    [[ -z "$app" || "$app" =~ ^# ]] && continue
    cat >> "${PREINSTALL_FILE}" <<EOF

[Flatpak Preinstall ${app}]
Branch=stable
IsRuntime=${is_runtime}
EOF
  done < "$list"
}

# Apps
generate_entries /ctx/flatpaks/system-flatpaks.list false

# DX apps
if [ "${IMAGE_FLAVOR}" == "dx" ] || [ "${IMAGE_FLAVOR}" == "dx-ai" ]; then
  generate_entries /ctx/flatpaks/system-flatpaks-dx.list false
fi

# Runtimes
generate_entries /ctx/flatpaks/system-runtimes.list true

echo "Generated preinstall file with $(grep -c '^\[Flatpak' "${PREINSTALL_FILE}") entries"

echo "::endgroup::"
