{ config, lib, pkgs, ... }:

{
  programs.mango.enable = true;
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      mango = {
        prettyName = "Mango";
        comment = "Mango compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/mango";
      };
    };
  };

}

