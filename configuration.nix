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
    appimage-run
    binutils
    bottom
    clang-tools
    crow
    feh
    firefox
    flameshot
    foliate
    fpc
    easyeffects
    gcc
    godot
    gimp
    gnumake
    gparted
    home-manager
    jre8
    kdePackages.isoimagewriter
    kitty
    libqt5pas
    lua
    lua-language-server
    lutris
    lxqt.lxqt-policykit
    mpv
    ncurses
    nix-index
    nemo
    file-roller
    nemo-fileroller
    neofetch
    obsidian
    onlyoffice-bin
    osu-lazer
    unrar
    unzip
    zip
    p7zip
    paprefs
    pamixer
    pavucontrol
    soundwireserver
    polybar
    peek
    protontricks
    pulseaudio
    quickemu
    qt6ct
    rocmPackages.llvm.clang
    rofi
    rquickshare
    telegram-desktop
    tree
    udiskie
    ventoy
    vesktop
    vim
    wineWowPackages.stable
    winetricks
    xorg.libX11
    xsel
    zerotierone
    zenity
    qbittorrent
    qalculate-gtk
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kde-cli-tools
    kdePackages.kio-extras
    kdePackages.karchive
    kdePackages.kio
    kdePackages.kio-fuse
  ];

  services.xserver.desktopManager.cinnamon.enable = true;

  environment.variables = {
    EDITOR = "hx";
  };

  fonts.packages = with pkgs; [ 
    nerd-fonts.jetbrains-mono 
    corefonts
    times-newer-roman
  ];

  programs.appimage.enable = true;
  
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
  # services.xserver.displayManager.lightdm.greeters.gtk.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  services.dbus.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];

  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "233ccaac27f59459"
    ];
  };

  networking.firewall.enable = false;
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
