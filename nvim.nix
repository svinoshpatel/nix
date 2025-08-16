{
  programs.nvf = {
    enable = true;

    # settings = {

      vim = {
            clipboard.enable = true;

        theme = {
                enable = true;
                name = "catppuccin";
                style = "mocha";
        };

        languages = {
              nix.enable = true;
              clang.enable = true;
              ts.enable = true;
              html.enable = true;          
        };
        options = {
      number = true;
      relativenumber = true;
      termguicolors = true;
      signcolumn = "yes";
      scrolloff = 999;

      tabstop = 4;
      shiftwidth = 4;
        softtabstop = 4;
        smartindent = true;

        ignorecase = true;
        smartcase = true;
        incsearch = true;
        };
      };
    # };
  };
}
