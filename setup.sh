#!/usr/bin/env bash

set -euo pipefail
sudo -v

# rosetta
if [[ "$(uname -m)" == "arm64" ]]; then
  softwareupdate --install-rosetta --agree-to-license &>/dev/null || true
  BREW=/opt/homebrew/bin/brew
else
  BREW=/usr/local/bin/brew
fi

sudo -v

# nix
if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
  echo "nix already installed"
else
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate --no-confirm
fi

if ! command -v nix &>/dev/null; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

sudo -v

# nix-darwin
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#$(uname -m)
set +u
. /etc/bashrc
sudo -v

# homebrew
if [[ -f $BREW ]]; then
  echo "homebrew already installed"
else
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v brew &>/dev/null; then
  eval "$($BREW shellenv)"
fi

task setup
