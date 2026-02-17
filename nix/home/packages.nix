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
    exercism

    # git
    git-delete-merged-branches
    git-lfs
    gh

    # nix
    nixd
    nixfmt

    # typescript
    biome
    yarn-berry

    cloudflared
    doggo
    fd
    flyctl
    gdu
    ghostscript
    go-task
    imagemagick
    just
    pnpm
    restic
    ripgrep
    typescript
    wakatime-cli
    yq
  ];

  programs.btop.enable = true;
  programs.direnv.enable = true;
  programs.lazygit.enable = true;
  programs.tealdeer.enable = true;

  programs.eza = enableFishIntegration true;
  programs.fzf = enableFishIntegration true;
  programs.starship = enableFishIntegration true;
  programs.zoxide = enableFishIntegration true;
}
