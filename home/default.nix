{
  imports = [
    ./packages.nix
    ./shell.nix
    ./theme.nix
  ];

  home.username = "vokin";
  home.homeDirectory = "/home/vokin";
  home.stateVersion = "25.11";
}
