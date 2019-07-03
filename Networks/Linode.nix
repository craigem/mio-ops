# NixOps configuration for the Linode VMs

{
  network = {
    description = "Linode servers";
  };

  defaults =
    { config, pkgs, lib, ... }:

    {
      imports =
        [
          ../Hardware/linode_vm.nix
          ../Deployments/host_common.nix
        ];

      # Ensure the right package architecture is used
      nixpkgs.localSystem = {
        system = "x86_64-linux";
        config = "x86_64-unknown-linux-gnu";
        allowUnfree = true;
      };

      # Tools that Linode support like to have install if you need them.
      environment.systemPackages = with pkgs; [
        inetutils
        mtr
        sysstat
      ];

      # Configure firewall defaults:
      networking = {
        usePredictableInterfaceNames = false; # As per Linode's networking guidlines
        domain = "mcwhirter.io";
        firewall = {
          enable = true;
          allowedTCPPorts = [  ];
          trustedInterfaces = [ "lo" ];
        };
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
