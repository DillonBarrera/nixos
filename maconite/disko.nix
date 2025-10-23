{ disks ? throw "Missing argument 'disks'. Set it explicitly, e.g.: disks = [ '/dev/sda' ]", hostname, ... }:
{
  disko.devices = {
    disk = {
      "${hostname}" = {
        type = "disk";
        device = builtins.elemAt disks 0;
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              size = "1G";
              type = "EF00";
              #uuid = "";
              content = {
                type = "filesystem";
                format = "vfat";
                extraArgs = [ "-F32" ];
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              priority = 2;
              size = "100%";
              content = {
                type = "luks";
                name = "crypt";
                extraOpenArgs = [ ];
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "lvm_pv";
                  vg = "vg_maconite";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      vg_maconite = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "@" = {
                  mountpoint = "/";
                  mountOptions = [ "compress=zstd:1" "noatime" "space_cache=v2" "discard=async" "ssd" ];
                };
                "@nix" = {
                  mountpoint = "/nix";
                  mountOptions = [ "compress=zstd:1" "noatime" "space_cache=v2" "discard=async" "ssd" ];
                };
                "@persist" = {
                  mountpoint = "/persist";
                  mountOptions = [ "compress=zstd:1" "noatime" "space_cache=v2" "discard=async" "ssd" ];
                };
              };
            };
          };
        };
      };
    };
  };
}

