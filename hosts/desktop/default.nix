{ pkgs, ... }:
{
  imports = [
    ./fonts.nix
  ];

  security.pam.services.hyprlock = { };

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
