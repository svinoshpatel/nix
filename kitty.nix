{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    shellIntegration.enableFishIntegration = true;
    
    settings = {
      confirm_os_window_close = 0;
      #background_opacity = "0.96";
      background_opacity = "0.99";
      font_family = "JetBrainsMonoNerdFont";
      font_size = "11.0";

      # The 16 terminal colors

      # black
      color0 = "#11111b"; # crust
      color8 = "#45475a"; # whalecrust
      
      # red
      color1 = "#f38ba8"; # red
      color9 = "#f3a6bc";# whalered
      
      # green
      color2 = "#c193f7";# mauve
      color10 = "#cca8f7"; # whalemauve
      
      # yellow
      color3 = "#f5a9e1"; # pink
      color11 = "#f5bee6"; # whalepink
      
      # blue
      color4 = "#7babfa"; #blue 
      color12 = "#9cbffa"; #whaleblue
      
      # magenta
      color5 = "#9f9bf3"; #violet
      color13 = "#b6b3f3"; #whalolet
      
      # cyan
      color6 = "#7fe2d1"; #cyan 
      color14 = "#9fe2d7"; #whalecyan
      
      # white
      color7 = "#bac2de"; #subtext
      color15 = "#cdd6f4"; #text
    };
  };
}
