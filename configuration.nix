{
  self,
  system,
  user,
  home,
  pkgs,
  ...
}:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    chezmoi
    go-task
    nixd
    nixfmt
    yq
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  nix.enable = false;
  users.users.${user}.home = home;
  programs.fish.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  environment = {
    shellInit = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';

    shellAliases = {
      lg = "lazygit";
      t = "task";
    };
  };
}
