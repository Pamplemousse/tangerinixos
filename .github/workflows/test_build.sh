#!/usr/bin/env bash

# We expect a host configuration to be present, to inherit certain values from.
sudo mkdir /etc/nixos
sudo cp ./tests/configuration_stub.nix /etc/nixos/configuration.nix
# Make `nixos-generate` available.
export PATH=$GITHUB_WORKSPACE/nixos-generators:$PATH
# Build!
nixos-generate -f vm -c ./tangerinixos.nix
