{ pkgs,...}:
{
fonts = {
    fonts = with pkgs; [
      # icon fonts
      material-symbols

      # normal fonts
      jost
      recursive
      inter
      atkinson-hyperlegible
      noto-fonts-extra #contains arimo
      gyre-fonts
      liberation_ttf
      work-sans

      lexend
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto
      ibm-plex

      # nerdfonts
      (nerdfonts.override {fonts = ["IBMPlexMono" "Iosevka" "FiraCode" "JetBrainsMono"];})
    ];

    # use fonts specified by user rather than default ones
    enableDefaultFonts = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}