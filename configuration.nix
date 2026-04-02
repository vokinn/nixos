{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Amsterdam";

  services.xserver.enable = false;
  programs.niri.enable = true;
  services.dbus.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  hardware.graphics.enable = true;
  programs.dconf.enable = true;
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    silent = false;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };

  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    }
  ];

  security.polkit.enable = true;

  users.users.vokin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "networkmanager"
    ];
    password = "kiruma";
    packages = with pkgs; [
      tree
    ];
  };

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    # communication
    librewolf
    vesktop

    # dev tools
    neovim
    lazygit
    codeberg-cli
    git
    gh

    # languages and toolchains
    cargo
    nodejs_24
    zig # i have this here just for the C compiler
    nixd
    nixfmt

    # terminal and shell
    alacritty
    tmux
    zsh
    starship
    zoxide
    fzf

    # wayland / compositor
    quickshell
    swaybg
    xwayland-satellite
    fuzzel

    # utilities
    ripgrep
    btop
    wl-clipboard
    bubblewrap
    unzip
    opencode
    stow

    # theming
    bibata-cursors
    adwaita-qt
    adwaita-qt6
    gnome-themes-extra
  ];

  environment.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland,x11";
    NIXOS_OZONE_WL = "1";
  };

  programs.zsh.enable = true;
  system.stateVersion = "25.11";
}
