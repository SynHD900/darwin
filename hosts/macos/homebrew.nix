{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];
  nix-homebrew = {
    enable = true;
    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = false;

    # User owning the Homebrew prefix
    user = config.system.primaryUser;
    # autoMigrate = true;

    # Optional: Declarative tap management
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
    mutableTaps = false;
  };
  homebrew = {
    brews = [
      # "openconnect"
    ];
    taps = builtins.attrNames config.nix-homebrew.taps;
    enable = true;
    casks = [
      "firefox"
      "nomachine"
      "spotify"
      "vesktop"
      "brave-browser"
      "nextcloud"
      "signal"
      "microsoft-teams"
      "microsoft-auto-update"
      "microsoft-office"
      "openvpn-connect"
      "steam"
      # "openconnect"
    ];

    onActivation.cleanup = "zap";
    global = {
      brewfile = true;
    };
  };
}
