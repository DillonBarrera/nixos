{ config, lib, pkgs, ... }: 

{
  options = {
    game.enable = lib.mkEnableOption "Enable gaming packages";
  };

    config = lib.mkIf config.game.enable {

      programs = {
        gamemode.enable = true;
        steam = {
          enable = true;
          extraCompatPackages = [
            pkgs.proton-ge-bin
          ];
        };
      };

      nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ];
    };
}
