{ config, lib, pkgs, ... }:
{
  home.file.".config/uwsm/env".text = ''
    export GTK_THEME=Adwaita:dark
    export QT_QPA_PLATFORM="wayland;xcb"
    export WAYLAND_DISPLAY=wayland-0
  '';
}
