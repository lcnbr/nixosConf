{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
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
      cm_unicode
      lmodern
      noto-fonts-emoji
      roboto
      ibm-plex

      iosevka-comfy.comfy

      (iosevka.override {
        set = "custom";
        privateBuildPlan = {
          family = "Iosevka Custom";
          spacing = "normal";
          serifs = "sans";
          noCvSs = true;
          exportGlyphNames = false;

          variants = {
            inherits = "ss15";
          };

          widths = {
            Condensed = {
              shape = 500;
              menu = 3;
              css = "condensed";
            };
            Normal = {
              shape = 600;
              menu = 5;
              css = "normal";
            };
          };
        };
      })

      # nerdfonts
      (nerdfonts.override {fonts = ["IBMPlexMono" "Iosevka" "FiraCode" "JetBrainsMono"];})
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["IBM Plex Serif" "Noto Color Emoji"];
      sansSerif = ["IBM Plex Sans" "Noto Color Emoji"];
      monospace = ["Iosevka Custom" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
