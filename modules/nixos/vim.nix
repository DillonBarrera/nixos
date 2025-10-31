{ pkgs, ... }:
{
    environment.variables = { EDITOR = "vim"; };

    environment.systemPackages = with pkgs; [
        ((vim-full.override { }).customize {
            name = "vim";
            
            vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
              start = [ vim-nix vim-lastplace ];
              opt = [];
            
            };
            vimrcConfig.customRC = ''
                set expandtab
                set smarttab
                set shiftwidth=4
                set tabstop=4
                set autoindent
                syntax on
                filetype plugin indent on
                set backspace=indent,eol,start
            '';
        }
    )];
}
