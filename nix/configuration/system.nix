{
  user,
  ...
}:

{
  system.primaryUser = user;

  system.defaults.dock = {
    autohide = true;
    mru-spaces = false;
    orientation = "left";
    persistent-apps = [ ];
    persistent-others = [ ];
    show-process-indicators = false;
    show-recents = false;
    showhidden = true;
    static-only = true;
    tilesize = 48;
  };
}
