{
  ...
}:

{
  home.sessionPath = [
    "/Applications/Postgres.app/Contents/Versions/latest/bin"
  ];

  programs.fish = {
    enable = true;

    shellInitLast = ''
      . $HOME/.config/fish/shell_init_last.fish
    '';
  };
}
