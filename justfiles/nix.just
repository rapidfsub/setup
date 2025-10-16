alias ns := darwin-rebuild-switch
alias nu := nix-flake-update
alias ngc := nix-collect-garbage

darwin-rebuild-switch:
  sudo darwin-rebuild switch --flake ~/setup/nix#$(uname -m)

nix-flake-update: && darwin-rebuild-switch
  nix flake update --flake ~/setup/nix

nix-collect-garbage:
  nix-env --delete-generations old
  nix-store --gc
  nix-collect-garbage -d
