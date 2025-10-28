{ config, pkgs, inputs, ... }:

{
  imports = [
    ./waybar.nix
    ../modules/home-manager
  ];

  home.username = "db";
  home.homeDirectory = "/home/db";
  # Automatically run nix-collect-garbage at a specified time
  nix.gc = {
    automatic = true;
    frequency = "weekly";
    persistent = true;
    options = "--delete-older-than 30d";
  };
  home.packages = [
    pkgs.git
    pkgs.usbutils # lsusb
    pkgs.fastfetch
    pkgs.rose-pine-cursor
    pkgs.brave
    pkgs.bat
  ];

  home.sessionVariables = { 
    BROWSER = "firefox";
  };

  xdg.mimeApps.enable = true;

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = "firefox.desktop";
  };

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
