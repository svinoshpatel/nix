{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.catppuccin.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      scrolloff = 8;

      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      autoindent = true;

      ignorecase = true;
      smartcase = true;

      termguicolors = true;

      wrap = false;
    };

    plugins = {
      treesitter = {
        enable = true;

        nixvimInjections = true;

        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      }; 
      lsp = {
        enable = true;
        servers = {
          lua-ls = {
            enable = true;
            settings = {
              completion.enable = true;
            };
          };
        };
      };

      hmts.enable = true;
    };
  };
}
