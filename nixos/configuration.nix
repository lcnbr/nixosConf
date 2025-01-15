{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ghostty,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    # inputs.hardware.nixosModules.framework-12th-gen-intel
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };




  environment.persistence."/persist" = {
    enable = true;  # NB: Defaults to true, not needed
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];
    #files = [
    #  "/etc/machine-id"
    #  { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    #];
    users.lcnbr = {
      directories = [
        "documents"
        "media"
        "dev"
        { directory = ".gnupg"; mode = "0700"; }
        { directory = ".ssh"; mode = "0700"; }
        { directory = ".nixops"; mode = "0700"; }
        { directory = ".local/share/keyrings"; mode = "0700"; }
        ".local/share/direnv"
      ];
      files = [
        ".screenrc"
      ];
    };
  };


  nix = {
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      substituters = ["https://hyprland.cachix.org" "https://cosmic.cachix.org/"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE= "];
    };
  };
  environment.systemPackages = [
    inputs.zen-browser.packages."x86_64-linux".default
    inputs.ghostty.packages.x86_64-linux.default
  ];
  networking.hostName = "gluluon";
  networking.hostId="b9ba5961";

  boot.loader.systemd-boot.enable = true;
  zramSwap.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_CH.UTF-8";
    LC_IDENTIFICATION = "fr_CH.UTF-8";
    LC_MEASUREMENT = "fr_CH.UTF-8";
    LC_MONETARY = "fr_CH.UTF-8";
    LC_NAME = "fr_CH.UTF-8";
    LC_NUMERIC = "fr_CH.UTF-8";
    LC_PAPER = "fr_CH.UTF-8";
    LC_TELEPHONE = "fr_CH.UTF-8";
    LC_TIME = "fr_CH.UTF-8";
  };

  console.useXkbConfig = true;

  services.xserver = {
    xkb = {
      layout = "us";
      variant = "colemak_dh_iso";
      options = "caps:escape";
    };
  };

  services = {
    tailscale = {
      enable = true;
    };
    logind = {
      extraConfig = "HandlePowerKey=suspend";
      lidSwitch = "suspend";
    };
    dbus = {
      enable = true;
      packages = with pkgs; [gcr];
    };
 	 desktopManager.cosmic.enable = true;
   # displayManager.cosmic-greeter.enable = true;
    fprintd.enable = true;
  };
  users.mutableUsers=false;
  users.users = {
    root={

      initialHashedPassword="$6$1EKwWplF7X6IP7d4$hcpJVomZ4k0LH8lpnNjkgcYJwciDh/fvcOo0/fSrg/z/VT.DQjN4weLg3gtZI4wniETjeycJbQAu6ElTBqFyN0";
    };
    lcnbr = {
      isNormalUser = true;
      initialHashedPassword="$6$1EKwWplF7X6IP7d4$hcpJVomZ4k0LH8lpnNjkgcYJwciDh/fvcOo0/fSrg/z/VT.DQjN4weLg3gtZI4wniETjeycJbQAu6ElTBqFyN0";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILwU7t6UJmWcDd+oayloWbTNixqe5J010amkU0p/7gKc im@lcnbr.ch"
      ];
      extraGroups = ["wheel" "networkmanager"];
    };
  };
  boot.supportedFilesystems = [ "zfs" ];
	boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;

  hardware.bluetooth.enable = true;
  hardware.opengl.enable = true;
  hardware.logitech.wireless.enable = true;
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  security = {
    pam.services.login.fprintAuth = true;
    pam.services.greetd.fprintAuth = true;
    pam.services.sudo.fprintAuth = true;
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  programs.nh = {
      enable = true;
      clean.enable = true;
      # clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/lcnbr/dev/nixos";
    };

  services = {
    getty = {
      autologinUser = "lcnbr";
    };
    fwupd = {
      enable = true;
    };
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
          user = "lcnbr";
        };
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # programs.nix-index-database.comma.enable = true;

  #age.secrets.ikmail.file = ../secrets/ikmail.age;

  disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "/dev/nvme0n1";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              zfs = {
                size = "100%";
                content = {
                  type = "zfs";
                  pool = "zroot";
                };
              };
            };
          };
        };
      };
      zpool = {
        zroot = {
          type = "zpool";
          rootFsOptions = {
            acltype = "posixacl";
            atime = "off";
            compression = "zstd";
            mountpoint = "none";
            xattr = "sa";
          };
          options.ashift = "12";

          datasets = {
            "local" = {
              type = "zfs_fs";
              options.mountpoint = "none";
            };
            "local/home" = {
              type = "zfs_fs";
              mountpoint = "/home";
              # Used by services.zfs.autoSnapshot options.
              options."com.sun:auto-snapshot" = "true";
            };
            "local/nix" = {
              type = "zfs_fs";
              mountpoint = "/nix";
              options."com.sun:auto-snapshot" = "false";
            };
            "local/persist" = {
              type = "zfs_fs";
              mountpoint = "/persist";
              options."com.sun:auto-snapshot" = "false";
            };
            "local/root" = {
              type = "zfs_fs";
              mountpoint = "/";
              options."com.sun:auto-snapshot" = "false";
              postCreateHook = "zfs list -t snapshot -H -o name | grep -E '^zroot/local/root@blank$' || zfs snapshot zroot/local/root@blank";
            };
          };
        };
      };
    };

    # boot.initrd.systemd.enable = true;

    #   # boot.initrd.systemd.services.reset = {
    #   #   description = "reset root filesystem";
    #   #   wantedBy = [ "initrd.target" ];
    #   #   after = [ "zfs-import-zroot.service" ];
    #   #   before = [ "sysroot.mount" ];
    #   #   path = with pkgs; [ zfs ];
    #   #   unitConfig.DefaultDependencies = "no";
    #   #   serviceConfig.Type = "oneshot";
    #   #   script = ''
    #   #       zfs rollback -r zroot/local/root@blank'';
    #   # };

    #   # boot.initrd.systemd.services.initrd-rollback-root = {
    #   #     after = [ "zfs-import-zroot.service" ];
    #   #     requires = [ "zfs-import-zroot.service" ];
    #   #     before = [ "sysroot.mount" ];
    #   #     wantedBy = [ "initrd.target" ];
    #   #     description = "Rollback root fs";
    #   #     serviceConfig = {
    #   #       Type = "oneshot";
    #   #       ExecStart = "${config.boot.zfs.package}/sbin/zfs rollback -r zroot/local/root@blank";
    #   #     };
    #   #   };
    #   boot.initrd.systemd.services.rollback = {
    #     description = "Rollback ZFS datasets to a pristine state";
    #     wantedBy = [
    #       "initrd.target"
    #     ];
    #     after = [
    #       "zfs-import-zroot.service"
    #     ];
    #     before = [
    #       "sysroot.mount"
    #     ];
    #     path = with pkgs; [
    #       zfs
    #     ];
    #     unitConfig.DefaultDependencies = "no";
    #     serviceConfig.Type = "oneshot";
    #     script = ''
    #       zfs rollback -r zroot/local/root@blank && echo "rollback complete"
    #     '';
    #   };
    # boot.initrd.postDeviceCommands = lib.mkAfter ''
       # zpool import zroot
       # zfs rollback -r zroot/local/root@blank
     # '';
     #
     boot.initrd.postResumeCommands = lib.mkAfter ''
        zfs rollback -r zroot/local/root@blank && echo "rollback complete"
      '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";


}
