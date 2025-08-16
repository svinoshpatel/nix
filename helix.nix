{
  programs.helix = {
    enable = true;
    languages = {
      language = [
      {
        name = "c";
        indent = {
          tab-width = 8;
          unit = "\t";
        };
      }
      {
        name = "cpp";
        indent = {
          tab-width = 8;
          unit = "\t";
        };
      }
      {
        name = "lua";
        indent = {
          tab-width = 3;
          unit = "\t";
        };
      }
      ];
    };
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        auto-pairs = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";        
        };
      };
    };
  };
}
