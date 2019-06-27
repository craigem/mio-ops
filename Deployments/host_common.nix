# Configuration common to all Raspberry Pi 3 Model B devices in the MIO rack

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

  # List services that you want to enable:
  services.openssh.enable = true; # Enable the OpenSSH daemon.

  # Users common across MIO Ops:
  users.mutableUsers = false;        # Remove any users not defined in here

  users.users.root = {
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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDtjE0YstRzlh+Zhlj03th9DYOkMqJ5xHUcderBq151K craige@mcwhirter.io"
    ];
  };

}
