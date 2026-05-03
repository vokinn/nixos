{
  imports = [
    ./packages.nix
    ./shell.nix
    ./theme.nix
    ./noctalia.nix
  ];

  home.username = "vokin";
  home.homeDirectory = "/home/vokin";
  home.stateVersion = "25.11";
}
