{ config, inputs, lib, ... }:
{
  nix = {
    settings = {
      extra-sandbox-paths = [
        (lib.mkIf config.programs.ccache.enable "${config.programs.ccache.cacheDir}")
      ];

      trusted-users = [ "elxreno" ];

      substituters = [
        "https://elxreno.cachix.org"
        "https://r-ryantm.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "elxreno.cachix.org-1:ozSPSY5S3/TpbcXi+/DdtSj1JlK3CPz3G+F92yRBXDQ="
        "r-ryantm.cachix.org-1:gkUbLkouDAyvBdpBX0JOdIiD2/DP1ldF3Z3Y6Gqcc4c="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      # auto-optimise-store = config.deviceSpecific.isLaptop;
    };

    daemonCPUSchedPolicy = "batch";
    daemonIOSchedClass = "idle";
    daemonIOSchedPriority = 7;

    registry.nixpkgs.flake = inputs.nixpkgs;

    nixPath = lib.mkForce [ "nixpkgs=${inputs.nixpkgs}" ];

    extraOptions = ''
      experimental-features = nix-command flakes
      builders-use-substitutes = true
    '';

    gc = lib.mkIf config.deviceSpecific.isServer {
      automatic = true;
      dates = "daily";
      options = "-d --delete-older-than 3d";
    };
  };
}
