{
	programs.nvf = {
		enable = true;

		# plugins = with pkgs.vimPlugins; [
		# 	vim-be-good
		# ];

		settings = {
			vim = {
				clipboard.enable = true;
				statusline.lualine.enable = true;
				telescope.enable = true;
				autocomplete.nvim-cmp.enable = true;
				diagnostics.enable = true;
				lsp.enable = true;

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
			};
		};
	};
}
