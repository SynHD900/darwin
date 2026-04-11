{
  system.defaults = {
    CustomUserPreferences.NSGlobalDomain."com.apple.mouse.linear" = true;
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleICUForce24HourTime = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      _HIHideMenuBar = false; # buggy ->
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      NewWindowTarget = "Home";
      QuitMenuItem = true;
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
    };
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 1.0;
    };
    WindowManager = {
      EnableStandardClickToShowDesktop = true;
    };
    dock = {
      autohide = true;
      magnification = true;
      persistent-apps = [
      ];
      show-recents = false;
    };
  };
}
