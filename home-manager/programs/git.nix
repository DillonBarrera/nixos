{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "db";
    userEmail = "dillon.barrera@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
