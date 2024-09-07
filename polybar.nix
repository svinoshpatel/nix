{
  services.polybar = {
    enable = true;

    script = "polybar &";

    settings = {
      "colors" = {
        background = "#181825";
        background-alt = "#313244";
        foreground = "#cdd6f4";
        primary = "#cba6f7";
        secondary = "#8abeb7";
        alert = "#f38ba8";
        disabled = "#6c7086";
      };
      "bar/example" = {
        width = "100%";
        height = "16pt";
        radius = "0";

        background = "$\{colors.background}";
        foreground = "$\{colors.foreground}";

        line.size = "3pt";
        border.size = "0pt";

        padding.left = "0";
        padding.right = "1";

        module-margin = "1";

        separator.text = "|";
        separator.foreground = "$\{colors.disabled}";

        font-0 = "JetBrainsMonoNerdFont:size=10;1";

        modules.left = "xworkspaces xwindow";
        modules.right = "pipewire xkeyboard wlan date";
cursor.click = "pointer"; cursor.scroll = "ns-resize";

        enable.ipc = true;

        wm.restack = "bspwm";
      };
      "module/xworkspaces" = {
        type = "internal/xworkspaces";

        label.active.text = "%name%";
        label.active.background = "$\{colors.background}";
        label.active.underline = "$\{colors.primary}";
        label.active.padding = 1;

        label.occupied.text = "%name%";
        label.occupied.padding = 1;

        label.urgent.text = "%name%";
        label.urgent.background = "$\{colors.alert}";
        label.urgent.padding = 1;

        label.empty.text = "%name%";
        label.empty.foreground = "$\{colors.disabled}";
        label.empty.padding = 1;
      };
      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:60:...%";
      };
      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        format.volume.prefix.text = "󰕾 ";
        format.volume.prefix.foreground = "$\{colors.primary}";
        format.volume.text = "<label-volume>";

        label.volume = "%percentage%";
        label.muted.text = "muted";
        label.muted.foreground = "$\{colors.disabled}";
      };
      "module/xkeyboard" = {
        type = "internal/xkeyboard";

        blacklist-0 = "num lock";
        label.layout.text = "%layout%";
        label.layout.foreground = "$\{colors.primary}";
        label.indicator.padding = 2;
        label.indicator.margin = 1;
        label.indicator.foreground = "$\{colors.background}";
        label.indicator.background = "$\{colors.secondary}";
      };
      "module/wlan" = {
        type = "internal/network";
        interval = 5;
        format.connected = "<label-connected>";
        format.disconnected = "<label-disconnected>";
        label.disconnected = "%{F#f5c2e7}%ifname%%{F#707880} disconnected";
        interface.type = "wireless";
        label.connected = "%essid%";
      };
      "module/date" = {
        type = "internal/date";
        interval = 1;
        date.text = "%H:%M";
        date.alt = "%Y-%m-%d %H:%M:%S";
        label.text = "%date%";
        label.foreground = "$\{colors.primary}";
      };
      "module/pipewire" = {
        type = "custom/script";
        format.prefix.text = "󰕾 ";
        format.prefix.foreground = "$\{colors.primary}";
        exec = "pamixer --get-volume-human";
        interval = 0.1;
        click.left = "exec pavucontrol &";
      };
      "settings" = {
        screenchange.reload = true;
        pseudo.transparency = true;
      };
    };
  };
}
