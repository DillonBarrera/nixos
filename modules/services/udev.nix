{ config, lib, pkgs, ... }: {

  services.udev.extraRules = ''
     ACTION=="add|change", KERNEL=="event[0-9]*", ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
}
