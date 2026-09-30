hostname:
{ pkgs, ... }:
{
  time.timeZone = "Asia/Tokyo";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod.enable = false;
  };

  security.rtkit.enable = true;

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    nix-ld.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    hostName = hostname;
    firewall.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    uinput.enable = true;
  };

  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", TAG+="uaccess"
  '';

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
    ];
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    baobab # disk usage analyzer
    cheese # photo booth
    epiphany # web browser
    gedit # text editor
    orca # screen reader
    simple-scan # document scanner
    yelp # help viewer
    file-roller # archive manager
    geary # email client
    seahorse # password manager

    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
  ];
}
