{ pkgs, ... }:
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
  environment.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland,x11";
    NIXOS_OZONE_WL = "1";
  };

  programs.zsh.enable = true;
  programs.dconf.enable = true;

  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  users.users.vokin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "networkmanager"
    ];
  };

  system.stateVersion = "25.11";
}
