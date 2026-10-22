{ pkgs, ... }:
{
  imports = [
    ./fonts.nix
  ];

  security.pam.services.hyprlock = { };

  programs.dconf.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    uinput.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    baobab
    cheese
    epiphany
    gedit
    orca
    simple-scan
    yelp
    file-roller
    geary
    seahorse
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

  services = {
    blueman.enable = true;

    displayManager.defaultSession = "niri";
    xserver.enable = true;

    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gnome" ];
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
    ];
  };
}
