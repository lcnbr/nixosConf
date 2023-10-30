{
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland.extraConfig = ''

            exec-once = wl-paste --type text --watch cliphist store
            $mod = SUPER
            $mainMod = $mod


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
        bindm = $mod, mouse:273, resizewindow

        #Colemak-dh mapping
    $Q=Q
    $W=W
    $F=F#E
    $P=P#R
    $B=B#T
    $J=J#Z
    $L=L#U
    $U=U#I
    $Y=Y#O

    $A=A
    $R=R#S
    $S=S#D
    $T=T#F
    $G=G
    $M=M#H
    $N=N#J
    $E=E#K
    $I=I#L
    $O=O#;

    $Z=Z#<
    $X=X#Z
    $C=C#X
    $D=D#C
    $V=V
    $K=K#N
    $H=H#M


    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = $mainMod, $C, killactive,
    bind = $mainMod, $M, exit,
    bind = $mainMod, $V, togglefloating,
    bind = $mainMod, $R, exec, wofi --show drun
    bind = $mainMod, $P, pseudo, # dwindle
    bind = $mainMod, $J, togglesplit, # dwindle

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
  '';
}
