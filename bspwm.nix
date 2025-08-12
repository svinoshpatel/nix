{
  xsession.windowManager.bspwm = {
    enable = true;
    
    extraConfigEarly = ''
        polybar &
        feh --bg-fill ~/Pictures/Art/skull-wallpaper.png
        dunst &
        Telegram &
        steam &
        kitty --class=bottom --hold sh -c "btm" &
        pgrep -x vesktop > /dev/null || vesktop &
        lxqt-policykit-agent &
        udiskie &
        xset s off -dpms
        
        bspc monitor -d 1 2 3 4 5 6 7
      '';

    settings = {
      border_width = 1;
      normal_border_color = "#45475a";
      focused_border_color = "#9399b2";
      window_gap = 0;

      focus_follows_pointer = true;

      split_ratio = 0.5;
      borderless_monocle = true;
      gapless_moonocle = true;

      ignore_ewmh_focus = true;
    };

    rules = {
      "*" = {
        state = "floating";
      };
      "kitty" = {
        state = "tiled";
      };
      "firefox" = {
        # state = "tiled";
      };
      "TelegramDesktop" = {
        desktop = "^3";
        state = "tiled";
      };
      "vesktop" = {
        desktop = "^3";
        state = "tiled";
        split_ratio = 0.3;
      };
      "steam" = {
        desktop = "^4";
      };
      "bottom" = {
        desktop = "^7";
        state = "tiled";
      };
    };
  };
}
