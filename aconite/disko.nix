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
                  keyFile = "/run/keys/hdd.key";
                  fallbackToPassword = true;
                  preOpenCommands = ''
                    for i in $(seq 1 30); do
                      if mount -n -t ext4 -o ro,noatime,nodev,nosuid /dev/disk/by-partuuid/3eedfb3e-f7b0-4ca3-8712-6dd6f56fea81 /run/keys; then
                        break
                      fi
                      sleep 1
                    done
                  '';
                  postOpenCommands = ''
                    umount -n /run/keys || true
                  '';
                };
                content = {
                  type = "lvm_pv";
                  vg = "vg_aconite";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      vg_aconite = {
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


