{
  inputs,
  mainUser,
  pkgs,
  system,
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  darwin = {
    system_defaults.enable = true;
    docker.enable = true;
    glazeWM.enable = false;
  };
  shared.common.enable = true;

  home-manager = {
    backupFileExtension = "backup";
    # useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit mainUser;
      inherit system;
    };
    users.${mainUser} = {
      imports = [
        ./home-manager
        inputs.nixosModules.home
      ];
    };
  };

  nix = {
    linux-builder.enable = true;

    # This line is a prerequisite
    settings.trusted-users = [ "@admin" ];
  };

  users.users.${mainUser}.home = "/Users/${mainUser}";
  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system = {
    stateVersion = 6;
    primaryUser = mainUser;
  };

  security.pki.installCACerts = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
  nix.settings.download-buffer-size = 50 * 1024 * 1024; # 50 MiB

  networking.hostName = "macos";

  # Enable SUDO TouchID, even with TMUX
  # security.pam.services.sudo_local.touchIdAuth = true;
  environment = {
    etc."pam.d/sudo_local".text = ''
      # Managed by Nix Darwin
      auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
      auth       sufficient     pam_tid.so
    '';
  };
}
