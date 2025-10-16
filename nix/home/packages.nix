{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    chezmoi

    # git
    git-delete-merged-branches
    git-lfs

    # nix
    nixd
    nixfmt

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
}
