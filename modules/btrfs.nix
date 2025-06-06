{

  fileSystems = {
    "/".options = [ "noatime" "ssd" "space_cache=v2" "compress=zstd:1" "discard=async" ];
    "/home".options = [ "noatime" "ssd" "space_cache=v2" "compress=zstd:1" "discard=async" ];
    "/nix".options = [ "noatime" "ssd" "space_cache=v2" "compress=zstd:1" "discard=async" ];
    "/var/log".options = [ "noatime" "ssd" "space_cache=v2" "compress=zstd:1" "discard=async" ];
    "/.snapshots".options = [ "noatime" "ssd" "space_cache=v2" "compress=zstd:1" "discard=async" ];
  };

  swapDevices = [ { device = "/swap/swapfile"; } ];

}
