# Configuration common to all my servers

{ config, pkgs, lib, ... }:

{
  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_AU.UTF-8";
  };

  time.timeZone = "Australia/Brisbane"; # Set your preferred timezone:

  # Set security options:
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Enable Nix garbage collection:
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 90d";

  # Set the system-wide environment
  environment = {
    systemPackages = with pkgs; [
      byobu # text-based window manager and terminal multiplexer.
      htop  # interactive process viewer
      tmux  # Terminal multiplexer required by byobu
    ];
  };

  # Program defauls for Linode VMs
  programs.zsh = {
    enable = true;
    autosuggestions = {
      enable = true;
    };
    # List of strings concatenated with "\n"
    #loginShellInit = ''
    #  _byobu_sourced=1 . byobu 2>/dev/null || true
    #'';
    ohMyZsh = {
      enable = true;
    };
  };
  programs.mosh = {
    enable = true;
    withUtempter = true;
  };

  # List services that you want to enable:
  services.openssh = {
    enable = true;          # Enable the OpenSSH daemon.
    permitRootLogin = "without-password";
    challengeResponseAuthentication = false;
    passwordAuthentication = false;
    openFirewall = true;
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };

  # Set the default shell for all users
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  # Users common across MIO Ops:
  users.mutableUsers = false;        # Remove any users not defined in here

  users.users.root = {
    hashedPassword = "$6$yak.T2uXItw5j2tU$E5kW9iDMXBc86voxJjxnrUcY0DrW/7WaQY0aGZ5sIJ2JPYZOhDslTKqOYK8sDSJGhM/mCxjPbJq4JGFsObN7D1";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDtjE0YstRzlh+Zhlj03th9DYOkMqJ5xHUcderBq151K craige@mcwhirter.io"
    ];
  };

  # MIO Ops groups:
  users.groups.craige.gid = 1000;

  # MIO Ops Users
  users.users.craige = {
    isNormalUser = true;
    uid = 1000;
    group = "craige";
    extraGroups = ["wheel" ];
    hashedPassword = "$6$ZNvCXNzwtdeV0pd$iKraghNGImwzx3IhVk6.wi6Bl7yFS6jLbxm9zeE4xq6.WLkYtVnnP323bstos8sVhD4L9Z21gMGVY3MLtmvlH0";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDtjE0YstRzlh+Zhlj03th9DYOkMqJ5xHUcderBq151K craige@mcwhirter.io"
    ];
  };

}
