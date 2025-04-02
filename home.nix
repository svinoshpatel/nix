{ config, pkgs, nvchad4nix, ... }: {

  imports = [
    ./sxhkd.nix
    ./bspwm.nix
    ./polybar.nix
    ./kitty.nix
    ./zathura.nix
    ./helix.nix
    ./git.nix
    nvchad4nix.homeManagerModule
  ];

  home = {
    username = "svinoshpatel";
    homeDirectory = "/home/svinoshpatel";
    stateVersion = "24.05";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix";
      homeswitch = "home-manager switch --flake ~/nix";
    };
    shellInit = ''
      function sshon
        eval (ssh-agent -c)
        ssh-add ~/.ssh/svinpass
      end
    '';
  };

  programs.nvchad = {
    enable = true;
  };
  home.file.".config/lua/plugins/init-1.lua".text = ''
    return {
      {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
      },

      -- These are some examples, uncomment them if you want to see them work!
      {
        "neovim/nvim-lspconfig",
        config = function()
          require "configs.lspconfig"
        end,
      },

      {
        "nvim-treesitter/nvim-treesitter",
        opts = {
          ensure_installed = {
            "vim",
            "lua",
            "vimdoc",
            "html",
            "css"
          },
        },
      },
    }
  '';

  programs.lazygit.enable = true;
  programs.yazi.enable = true;

  # services.udiskie.enable = true;
  services.picom.enable = true;
  services.dunst.enable = true;
}
