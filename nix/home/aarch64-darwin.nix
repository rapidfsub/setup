{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    gomi
  ];
}
