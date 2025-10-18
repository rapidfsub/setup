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
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
  };

  system.defaults.finder = {
    NewWindowTarget = "Home";
  };

  system.defaults.NSGlobalDomain = {
    AppleICUForce24HourTime = true;
    ApplePressAndHoldEnabled = false;
    AppleShowAllExtensions = true;
    # from 15 to 120
    InitialKeyRepeat = 15;
    # from 2 to 120
    KeyRepeat = 1;
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticDashSubstitutionEnabled = false;
    NSAutomaticPeriodSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = false;
  };
}
