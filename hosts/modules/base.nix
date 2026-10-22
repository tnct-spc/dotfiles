hostname:
{ ... }:
{
  time.timeZone = "Asia/Tokyo";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod.enable = false;
  };

  security.rtkit.enable = true;

  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    hostName = hostname;
    firewall.enable = true;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
    ];
  };
}
