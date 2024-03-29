# NixOps configuration for the Raspberry Pi 3B Rack

{
  network = {
    description = "Raspberry Pi 3B Rack";
  };

  defaults = {
    imports =
      [
        ../Hardware/raspberry_pi_3_model_B.nix
        ../Deployments/pi3B_rack.nix
        ../Deployments/host_common.nix
      ];

    # Ensure the right package architecture is used
    nixpkgs.localSystem = {
      system = "aarch64-linux";
      config = "aarch64-unknown-linux-gnu";
      allowUnfree = true;
    };
  };

  pi-tri =
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
