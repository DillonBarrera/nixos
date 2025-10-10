# amdgpu.nix
{ config, lib, pkgs, ...}: {

  boot.kernelModules = [ "amdgpu" ];
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

}

