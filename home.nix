{ config, pkgs, ... }: {

  imports = [ ./sxhkd.nix ./bspwm.nix ./polybar.nix ./kitty.nix ./zathura.nix ./helix.nix ./git.nix ];

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
  };

  programs.lazygit.enable = true;
  programs.yazi.enable = true;

  services.udiskie.enable = true;
  services.picom.enable = true;
}
