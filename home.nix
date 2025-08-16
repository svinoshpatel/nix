{ config, pkgs, nvchad4nix, ... }: {

  imports = [
    ./sxhkd.nix
    ./bspwm.nix
    ./polybar.nix
    ./kitty.nix
    ./zathura.nix
    ./helix.nix
    ./git.nix
    ./nvim.nix
  ];

  home = {
    username = "svinoshpatel";
    homeDirectory = "/home/svinoshpatel";
    stateVersion = "24.05";
    sessionVariables = {
      PATH = "$HOME/nix/scripts/bin:$PATH";
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      # rebuild = "sudo nixos-rebuild switch --flake ~/nix";
      # homeswitch = "home-manager switch --flake ~/nix";
    };
    shellInit = ''
      function sshon
        eval (ssh-agent -c)
        ssh-add ~/.ssh/svinpass
      end

      function update
        cd ~/nix
        nix flake update
        sudo nixos-rebuild switch --flake .
        git commit -am "Update flake.lock"
        sshon
        git push
      end

      function rebuild
        cd ~/nix
        sudo nixos-rebuild switch --flake .
        git commit -am "System rebuild"
        sshon
        git push
      end

      function homeswitch
        cd ~/nix
        home-manager switch --flake .
        git commit -am "Home manager rebuild"
        sshon
        git push
      end
    '';
  };

  programs.lazygit.enable = true;
  programs.yazi.enable = true;

  # services.udiskie.enable = true;
  services.picom.enable = true;
  services.dunst.enable = true;
}
