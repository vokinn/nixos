{
  pkgs,
  noctalia,
  ...
}:
{
  imports = [
    noctalia.homeModules.default
  ];

  home.packages = [
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.noctalia-shell = {
    enable = true;
  };
}
