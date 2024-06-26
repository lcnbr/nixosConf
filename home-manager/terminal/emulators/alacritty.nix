{default, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "none";
        dynamic_padding = true;
        padding = {
          x = 5;
          y = 5;
        };
      };

      scrolling.history = 10000;

      colors = {
        draw_bold_text_with_bright_colors = true;
      };
      window.opacity = 0.8;
    };
  };
}
