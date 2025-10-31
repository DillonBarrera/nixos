{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "db";
      user.email = "dillon.barrera@gmail.com";
      init.defaultBranch = "main";
    };
  };
}
