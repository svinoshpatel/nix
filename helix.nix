{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        auto-pairs = false;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";        
        };
      };
    };
  };
}
