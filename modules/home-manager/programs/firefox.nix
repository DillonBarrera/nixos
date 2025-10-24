{ config, lib, pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://duckduckgo.com";
          "browser.fullscreen.autohide" = false;
          "identity.fxaccounts.enabled" = false;
        };
      };
    };
  };
}
