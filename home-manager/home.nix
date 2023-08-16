# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    inputs.hyprland.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./wayland
    ./terminals/wezterm.nix
    ./shells/nushell.nix
    ./terminals/alacritty.nix
    ./editors/helix
    ./programs
    ./users/lcnbr.nix
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
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "lcnbr";
    homeDirectory = "/home/lcnbr";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    bluetuith
    xplr #terminal file manager
    qt6.qtwayland
    nil #nix LSP, for helix auto complete
    alejandra
    light #display brightness
    firefox-wayland #duh
    wofi #for app launch
    tailscale #for ssh
    minecraft
    telegram-desktop
    xorg.setxkbmap
    obsidian
    pavucontrol
    python3
    poetry
    zotero
    libreoffice-fresh
    blender
    pdfarranger
    typst
    typstfmt
    typst-lsp
    typst-live
    gitui
    djvulibre
    gcc
    guvcview
    blender
    acpi
    zoom-us
    zathura
    libgnomekbd
    wl-clipboard #clipboard
    cliphist #clipboard manager
    libsForQt5.polkit-kde-agent #authentication
    eww-wayland #widgets
  ];
  xdg = {
    enable = true;
  };
  # Enable home-manager and git
  programs.home-manager.enable = true;

  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";

    package = pkgs.catppuccin-cursors.mochaDark;

    size = 16;
  };

  services = {
    dunst.enable = true;
  };

  programs = {
    git = {
      enable = true;
      userName = "lcnbr";
      userEmail = "im@lcnbr.ch";
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };

    bash = {
      enable = true;
      sessionVariables = {
        EDITOR = "nano";
        SHELL = "nu";
      };
    };
    fish = {
      enable = true;
    };

    rbw = {
      enable = true;
      settings = {
        email = "login@lcnbr.ch";
      };
    };
  };

  home.sessionVariables = {
    SHELL = "nu";
    EDITOR = "nano";

    BW_CLIENTID = "user.b2d5c327-419b-4da8-80ad-acf000ad72a9";
  };

  home.keyboard = {
    layout = "us";
    variant = "colemak_dh_iso";
    options = ["caps:escape"];
  };

  programs.waybar.enable = false;
  programs.vscode.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
