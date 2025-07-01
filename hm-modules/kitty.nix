{ config, lib, pkgs, ... }:
{
  home.file.".config/kitty/kitty.conf".text = ''
    confirm_os_window_close 0
  '';
}
