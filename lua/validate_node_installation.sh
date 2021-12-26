#!/usr/bin/env bash
set -eoux pipefail

function __validate_node_installation() {
  local pkg_manager="$1"
  local manager_home
  manager_home="$($pkg_manager config get prefix 2>/dev/null)"

  if [ ! -d "$manager_home" ] || [ ! -w "$manager_home" ]; then
    echo "[ERROR] Unable to install without administrative privileges. Please set your NPM_HOME correctly and try again."
    exit 1
  else
    echo "[SUCCESS] using prefix $manager_home"
  fi

}

__validate_node_installation "npm"
# __validate_node_installation "yarn"
