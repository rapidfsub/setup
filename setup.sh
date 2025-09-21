#!/usr/bin/env bash

set -euo pipefail

if sudo -v; then
  while sleep 30; do sudo -n true &>/dev/null; done &
  KEEPALIVE_PID=$!
  trap "kill $KEEPALIVE_PID &>/dev/null || true" EXIT
else
  echo "sudo required"
  exit 1
fi

xcode-select --install &>/dev/null || true

if [[ "$(uname -m)" == "arm64" ]]; then
  softwareupdate --install-rosetta --agree-to-license &>/dev/null || true
  BREW=/opt/homebrew/bin/brew
  NIX_HOST=simple
else
  BREW=/usr/local/bin/brew
  NIX_HOST=x86
fi

# nix
if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
  echo "nix already installed"
else
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate --no-confirm
fi

if ! command -v nix &>/dev/null; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

# nix-darwin
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#$NIX_HOST
set +u
. /etc/bashrc

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
