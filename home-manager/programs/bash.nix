{ config, lib, pkgs, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls -la --color";
    };

    initExtra = ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
}
