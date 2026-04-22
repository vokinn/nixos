{ config, ... }:
{
  security.polkit.enable = true;

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/vokin/.config/sops/age/keys.txt";

  sops.secrets.vokin-password.neededForUsers = true;

  users.users.vokin = {
    hashedPasswordFile = config.sops.secrets.vokin-password.path;
  };
}
