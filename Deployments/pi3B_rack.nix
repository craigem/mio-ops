# Configuration common to all Raspberry Pi 3 Model B devices in the MIO rack

{ config, pkgs, lib, ... }:

{
  networking.wireless.enable = false;  # Toggles wireless support via wpa_supplicant.

}
