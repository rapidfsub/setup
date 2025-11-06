{
  pkgs,
  ...
}:

let
  enableFishIntegration = enable: {
    inherit enable;
    enableFishIntegration = enable;
  };
in
{
  home.packages = with pkgs; [
    chezmoi
    lazygit

    # git
    git-delete-merged-branches
    git-lfs
    gh

    # nix
    nixd
    nixfmt

    doggo
    dotenvx
    fd
    flyctl
    gdu
    ghostscript
    go-task
    just
    ripgrep
    yq
  ];

  programs.btop.enable = true;
  programs.direnv.enable = true;
  # programs.lazygit.enable = true;
  programs.tealdeer.enable = true;

  programs.eza = enableFishIntegration true;
  programs.fzf = enableFishIntegration true;
  programs.starship = enableFishIntegration true;
  programs.zoxide = enableFishIntegration true;
}
