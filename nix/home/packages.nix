{
  # config,
  pkgs,
  ...
}:

{
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
}
