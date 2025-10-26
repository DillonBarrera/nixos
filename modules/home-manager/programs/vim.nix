{ config, lib, pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = [
      pkgs.vimPlugins.vim-airline
    ];
    settings = {
      ignorecase = true;
      smartcase = true;
    };
    extraConfig = ''
      set mouse=a
      autocmd BufNewFile *.nix 0r ${config.home.homeDirectory}/.config/vim/skeleton.nix
      autocmd BufNewFile *.nix call cursor(3,2) | startinsert!
    '';
  };

  home.file.".config/vim/skeleton.nix".text = ''
    { config, lib, pkgs, ... }:

    {

    }
    '';
}
