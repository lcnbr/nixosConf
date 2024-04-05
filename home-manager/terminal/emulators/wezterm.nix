{
  default,
  inputs,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = false;
    extraConfig = ''
      local wezterm = require "wezterm"



      return {
        color_scheme = "Catppuccin Latte",
        window_background_opacity =   0.9,
        enable_scroll_bar = false,
        font=wezterm.font( "BlexMono Nerd Font", { weight = 'Medium'}),
        enable_tab_bar = false,
        scrollback_lines = 10000,
        window_padding = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10,
        },
        font_size= 13,
        enable_wayland = true,
        check_for_updates = false,
        hide_mouse_cursor_when_typing = false,
        default_cursor_style = "SteadyBar",
        default_prog ={"nu"},
      }
    '';
    # package = inputs.wezterm.packages.${pkgs.system}.default;
  };
}
