{
  # config,
  pkgs,
  user,
  home,
  ...
}:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = user;
  home.homeDirectory = home;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    asdf-vm
    chezmoi
    dotenvx
    fd
    flyctl
    go-task
    git-delete-merged-branches
    git-lfs
    nixd
    nixfmt
    ripgrep
    yq
  ];

  home.shellAliases = {
    lg = "lazygit";
    t = "task";
  };

  home.sessionPath = [
    "/Applications/Postgres.app/Contents/Versions/latest/bin"
  ];

  programs.direnv.enable = true;
  programs.lazygit.enable = true;

  programs.fish = {
    enable = true;
    shellInitLast = ''
      if test "$(uname -m)" = "arm64"
        eval "$(/opt/homebrew/bin/brew shellenv)"
      else
        eval "$(/usr/local/bin/brew shellenv)"
      end

      . "${pkgs.asdf-vm}/share/asdf-vm/asdf.fish"
      . "${pkgs.asdf-vm}/share/fish/vendor_completions.d/asdf.fish"
    '';
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
