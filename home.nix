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
    chezmoi
    dotenvx
    fd
    flyctl
    gdu
    ghostscript
    go-task
    git-delete-merged-branches
    git-lfs
    nixd
    nixfmt
    ripgrep
    yq
  ];

  home.shellAliases = {
    em = "echo \"MIX_ENV=$MIX_ENV\"";
    emd = "export MIX_ENV=dev && em";
    emt = "export MIX_ENV=test && em";
    lg = "lazygit";
    t = "task";
  };

  home.sessionPath = [
    "/Applications/Postgres.app/Contents/Versions/latest/bin"
  ];

  programs.btop.enable = true;
  programs.direnv.enable = true;
  programs.lazygit.enable = true;
  programs.tealdeer.enable = true;

  programs.fish = {
    enable = true;

    shellInitLast = ''
      . $HOME/.config/fish/shell_init_last.fish
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
