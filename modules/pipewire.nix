# pipewire.nix
#
# This module configures PipeWire for audio management on NixOS.
# PipeWire is a modern audio and video server that replaces PulseAudio and JACK.
#
# This configuration enables the PipeWire services for:
# - Audio routing via ALSA, PulseAudio, and JACK compatibility
# - PipeWire Bluetooth support (if enabled)
# - PipeWire PulseAudio emulation (for compatibility with PulseAudio apps)
#
# Optionally, WirePlumber can be enabled as a session manager for advanced session
# and device management. If WirePlumber is not enabled, PipeWire's default session manager
# will be used, which provides basic functionality but lacks advanced routing and device
# management features.
#
# Usage:
# - Enable PipeWire by setting services.pipewire.enable = true;
# - Customize the configuration by enabling/disabling ALSA, PulseAudio, and JACK support
# - Enable WirePlumber for advanced session management and device control.

{

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;

  };

  hardware.bluetooth = {
    enable = true;
  };
}
