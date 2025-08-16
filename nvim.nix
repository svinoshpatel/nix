{
  programs.nvf = {
    enable = true;

    # vim.clipboard.enable = true;

    # vim.theme = {
    #   enable = true;
    #   name = "catppuccin";
    #   style = "mocha";
    # };

    # vim.languages = {
    #   nix.enable = true;
    #   clang.enable = true;
    #   ts.enable = true;
    #   html.enable = true;
    # };

    settings = {
      number = true;
      relativenumber = true;
      termguicolors = true;
      signcolumn = "yes";
      scrolloff = 999;

      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      smartindent = true;

      ignorcase = true;
      smartcase = true;
      incsearch = true;
    };
  };
}
