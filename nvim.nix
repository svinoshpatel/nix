{ pkgs, ... }: {
	programs.nvf = {
		enable = true;

		settings = {
			vim = {
				clipboard.enable = true;
				statusline.lualine.enable = true;
				telescope.enable = true;
				lsp.enable = true;

				autopairs.nvim-autopairs.enable = true;
				autocomplete.nvim-cmp.enable = true;

				diagnostics = {
					enable = true;
					config.virtual_text = true;
					config.signs = true;
				};

				theme = {
					enable = true;
					name = "catppuccin";
					style = "mocha";
				};

				languages = {
					enableTreesitter = true;

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
					scrolloff = 8;

					tabstop = 4;
					shiftwidth = 4;
					softtabstop = 0;
					smartindent = true;
					expandtab = false;

					wrap = false;

					ignorecase = true;
					smartcase = true;
					incsearch = true;
				};

				keymaps = [
					{
						key = "<leader>p";
						mode = "x";
						action = "\"_dP";
					}
					{
						key = "<leader>y";
						mode = ["n" "v"];
						action = "\"+y";
					}
					{
						key = "<leader>Y";
						mode = "n";
						action = "\"+Y";
					}
				];

				lazy.plugins = {
					"vim-be-good" = {
						package = pkgs.vimPlugins.vim-be-good;
						cmd = ["VimBeGood"];
					};
				};
			};
		};
	};
}
