{ config, lib, pkgs, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls -la --color";
    };

    initExtra = ''
      if uwsm check may-start && uwsm select; then
        exec uwsm start default
      fi
    '';
  };
}
