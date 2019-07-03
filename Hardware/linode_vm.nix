# Configuration common to all my Linode VMs

{ config, pkgs, lib, ... }:

{
  imports = [
    # Import the NixOS Qemu guest settings
    <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
  ];

  boot.initrd.availableKernelModules = [ "virtio_pci" "ahci" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [ "console=ttyS0,19200n8" ];
  boot.loader = {
    grub = {
      extraConfig = ''
        serial --speed=19200 --unit=0 --word=8 --parity=no --stop=1;
        terminal_input serial;
        terminal_output serial
      '';
      device = "nodev";
    };
    timeout = 10;
  };

  # File systems configuration for the Linode VMs
  fileSystems."/" =
    { device = "/dev/sda";
      fsType = "ext4";
    };

  swapDevices = [
    {
      device = "/dev/sdb";
    }
  ];

  nix.maxJobs = lib.mkDefault 4;
}
