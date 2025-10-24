{ config, lib, pkgs, ... }: {
  home.file.".config/kitty/kitty.conf".text = ''
    confirm_os_window_close 0
    window_padding_width 0 4 2
    hide_window_decorations yes
    include current-theme.conf
  '';
}
