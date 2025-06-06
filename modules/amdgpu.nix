# amdgpu.nix
{ config, lib, pkgs, ...}:

{
  # Enable the amdgpu kernel module
  boot.kernelModules = [ "amdgpu" ];
  
  # Enable graphics acceleration
  hardware.graphics = {
    enable = true;
    #driSupport = true;
    #driSupport32Bit = true;
  };

  # The AMDVLK drivers can be used in addition to the Mesa RADV drivers. 
  # The program will choose which one to use:

  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
  ];
  # For 32 bit applications
  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  # Force radv
  environment.variables.AMD_VULKAN_ICD = "RADV";

}

