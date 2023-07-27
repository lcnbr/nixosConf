
{default, ...}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require "wezterm"

      return {
        color_scheme = "Catppuccin Latte",
        window_background_opacity =   0.9,
        enable_scroll_bar = false,
        enable_tab_bar = false,
        scrollback_lines = 10000,
        window_padding = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10,
        },
        check_for_updates = false,
        hide_mouse_cursor_when_typing = false,
        default_cursor_style = "SteadyBar",
        default_prog ={"nu"},
      }
    '';
  };
}
