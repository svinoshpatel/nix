{
  services.sxhkd = {
    enable = true;

    keybindings = {

      ##########################
      # wm independent hotkeys #
      ##########################

      # terminal emulator
      "super + Return" = "kitty";

      # make sxhkd reload it's configuration files
      "super + Escape" = "pkill -USR1 -x sxhkd";

      # program launcher
      "super + r" = "setxkbmap us; rofi -show run";

      # change layout
      "shift + Alt_L" = "setxkbmap -query | grep -q 'ua' && setxkbmap us || setxkbmap ua";

      # volume control
      "super + equal" = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
      "super + minus" = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
      "super + 0" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";

      # screenshot
      "super + p" = "flameshot gui";
      "super + ctrl + p" = "flameshot screen -c";
      "super + shift + p" = "flameshot screen";

      #################
      # bspwm hotkeys #
      #################

      # quit/restart bspwm
      "super + alt + {q,r}" = "bspc {quit,wm -r}";

      # close window
      "super + shift + c" = "bspc node -c";

      # kill window
      "super + ctrl + c" = "bspc node --kill";

      # switch between the tiled and monocle layout
      "super + m" = "bspc desktop -l next";

      ###############
      # state/flags #
      ###############

      # set window state
      "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";

      ##############
      # focus/swap #
      ##############

      # focus the node in the given direction
      "super + {_,shift +}{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

      # focus or sent to the given desktop
      "super + {_,shift +}{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      # Cycle forward through windows
      "alt + Tab" = "bspc node -f next.local"

      # Cycle backward through windows
      "alt + shift + Tab" = "bspc node -f prev.local"


      #############
      # preselect #
      #############

      # preselect the direction
      "super + alt + {h,j,k,l}" = "bspc node -p {west,south,north,east}";

      # preselect the ratio
      "super + alt + {1-9}" = "bspc node -o 0.{1-9}";

      # cancel the preselection for the focused node
      "super + alt + space" = "bspc node -p cancel";


      ###############
      # move/resize #
      ###############

      # resize tiled window 
      "super + ctrl + {h,j,k,l}" = ''bspc node -z {left -20 0 || bspc node -z right -20 0, \
                bottom 0 20 || bspc node -z top 0 20,\
                top 0 -20 || bspc node -z bottom 0 -20,\
                right 20 0 || bspc node -z left 20 0}'';

      # move a floating window
      "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";

      # rotate parent window
      "super + {_,shift +} e" = "bspc node '@parent' -R {_,-}90";
    };
  };
}
