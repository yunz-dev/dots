#!/usr/bin/env bash
  # Copy the folder recursively with force overwrite
  cp -rf "/etc/nixos" "$HOME/dots"

  echo "Successfully updated nix config"

exit 0

