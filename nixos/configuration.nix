# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ./fonts.nix
    # inputs.hardware.nixosModules.framework-12th-gen-intel
    inputs.agenix.nixosModules.default
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };
  environment.systemPackages = [
    inputs.agenix.packages."x86_64-linux".default
  ];
  networking.hostName = "gluluon";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
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

  # Configure keymap in X11
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

    fprintd.enable = true;
  };
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    lcnbr = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILwU7t6UJmWcDd+oayloWbTNixqe5J010amkU0p/7gKc im@lcnbr.ch"
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["wheel" "networkmanager"];
    };
  };

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

  services = {
    getty = {
      autologinUser = "lcnbr";
    };
    fwupd = {
      enable = true;
    };
    openssh = {
      enable = true;
      # Forbid root login through SSH.
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      # Use keys only. Remove if you want to SSH using password (not recommended)
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
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  age.secrets.ikmail.file = ../secrets/ikmail.age;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
