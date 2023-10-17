{
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland.extraConfig = ''
      
                exec-once = wl-paste --type text --watch cliphist store    
                $mod = SUPER 
                bind = $mod, R, exec, wofi --show drun,
                bind = $mod, C, killactive,
                bind = $mod, tab, workspace, m+1
                bind = $mod, mouse_down, workspace, e+1
                bind = $mod, mouse_up, workspace, e-1
                bind = $mod SHIFT,tab, workspace, m-1

                input {
      
                 kb_layout = ch
            kb_variant = fr
            kb_model =
            kb_options =
            kb_rules =

            follow_mouse = 1

            touchpad {
                natural_scroll = true
            }

            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }

        device:at-translated-set-2-keyboard {
            kb_layout = ${config.home.keyboard.layout}
            kb_variant = ${config.home.keyboard.variant}
            kb_model =
            kb_options =
            kb_options = ${lib.strings.concatStringsSep "," config.home.keyboard.options}
    

        }

        device:thinkpad-extra-buttons {
            kb_layout = ${config.home.keyboard.layout}
            kb_variant = ${config.home.keyboard.variant}
            kb_model =
            kb_options =
            kb_options = ${lib.strings.concatStringsSep "," config.home.keyboard.options}

        }
                monitor =,prefered,auto,1
                monitor = desc:LG Electronics LG IPS QHD 305NTEPAY244,2560x1440,1920x555,1    
                monitor =desc:LG Electronics LG IPS QHD 305NTMXAY243,2560x1440,4480x0,1,transform,3

                general {
                  gaps_in =5
                  gaps_out = 20
                  border_size = 2
                  layout = dwindle
                  resize_on_border = true
                }

                decoration {
                 rounding = 4

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
            bindm = $mod, mouse:273, resizewindow  # Clamshell mode configuration

    ## Lid is opened
    bindl=,switch:off:Lid Switch,exec,${./lid.sh} open

    ## Lid is closed
    bindl=,switch:on:Lid Switch,exec,${./lib.sh} close'';
}
