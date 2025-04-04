# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl88xxau-aircrack
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "hruk"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Nix garbage collection
  nix.settings.auto-optimise-store = true;  # Deduplicate identical files
  nix.gc = {
    automatic = true;
    dates = "weekly"; # runs the garbage collector once a week
    options = "--delete-older-than 30d";  # Keeps last 30 days of generations
  };
  boot.loader.systemd-boot.configurationLimit = 10;  # Keeps last 10 boot entries

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.svinoshpatel = {
    isNormalUser = true;
    description = "svinoshpatel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kitty
    firefox
    rofi
    home-manager
    vesktop
    pavucontrol
    pulseaudio
    p7zip
    tree
    telegram-desktop
    udiskie
    bottom
    polybar
    lutris
    wineWowPackages.stable
    winetricks
    flameshot
    neofetch
    feh
    pamixer
    qbittorrent
    mpv
    vim
    onlyoffice-bin
    quickemu
    lua
    lua-language-server
    fpc
    binutils
    lazarus-qt
    gnumake
    foliate
    gimp
    clang-tools
    gcc
    rocmPackages.llvm.clang
    xorg.libX11
    libqt5pas
    qalculate-gtk
    libsForQt5.dolphin
    kdePackages.isoimagewriter
    gparted
    lxqt.lxqt-policykit
    ventoy
    nemo
    zerotierone
    jre8
    atlauncher
    r2modman
    protontricks
    xsel
  ];

  environment.variables = {
    EDITOR = "hx";
  };


  fonts.packages = with pkgs; [ 
    nerd-fonts.jetbrains-mono 
    corefonts
    times-newer-roman
  ];
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRINGS} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  programs.fish.enable = true;

  # Enable sound with pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.udisks2.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "233ccaac27f59459"
    ];
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
