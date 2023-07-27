{
config,
lib,
...
  
}:{

wayland.windowManager.hyprland.extraConfig = ''
    
    exec-once = wl-paste --type text --watch cliphist store    
    $mod = SUPER 
    bind = $mod, R, exec, wofi --show drun,
    bind = $mod, C, killactive,

    input {
      kb_layout = ${config.home.keyboard.layout}
      kb_variant = ${config.home.keyboard.variant}
      touchpad {
        natural_scroll = true
      }
      kb_options = ${lib.strings.concatStringsSep "," config.home.keyboard.options}
    }
    monitor =,prefered,auto,1

    general {
      gaps_in =5
      gaps_out = 20
      border_size = 2
      layout = dwindle
      resize_on_border = true
    }

    decoration {
     rounding = 4
    blur = true
    blur_size = 3
    blur_passes = 1
    blur_new_optimizations = true

    drop_shadow = true
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
    }

    animations {
    enabled = true

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

misc {
    focus_on_activate = false
    disable_hyprland_logo = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = true
}

bindm = $mod, mouse:272, movewindow
bindm = $mod, mouse:273, resizewindow  '';
}