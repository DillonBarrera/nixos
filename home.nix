{ config, pkgs, inputs, ... }:

{
  home.username = "db";
  home.homeDirectory = "/home/db";
  # Automatically run nix-collect-garbage at a specified time
  nix.gc = {
    automatic = true;
    frequency = "weekly";
    persistent = true;
    options = "--delete-older-than 30d";
  };
  home.packages = with pkgs; [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    git

    usbutils # lsusb
  ];

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

  programs.git = {
    enable = true;
    userName = "db";
    userEmail = "dillon.barrera@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
     # safe.directory = "/etc/nixos";
    };
  };

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

  home.sessionVariables = { 
    BROWSER = "firefox";
  };

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
