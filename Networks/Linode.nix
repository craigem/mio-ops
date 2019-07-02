# NixOps configuration for the Raspberry Pi 3B Rack

{
  network = {
    description = "Linode servers";
  };

  defaults = {
    imports =
      [
        ../Deployments/host_common.nix
      ];

    # Ensure the right package architecture is used
    nixpkgs.localSystem = {
      system = "x86_64-linux";
      config = "x86_64-unknown-linux-gnu";
      allowUnfree = true;
    };
  };

  cuallaidh =
    { config, pkgs, lib, ... }:

    {
      # This value determines the NixOS release with which your system is to be
      # compatible, in order to avoid breaking some software such as database
      # servers. You should change this only after NixOS release notes say you
      # should.
      system.stateVersion = "19.03"; # Did you read the comment?
      system.autoUpgrade.enable = true;
      system.autoUpgrade.channel = https://nixos.org/channels/nixos-19.03;
    };
}
