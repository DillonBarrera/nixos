{ config, lib, pkgs, ... }:

{
  programs.dconf.enable = true;

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];

}

