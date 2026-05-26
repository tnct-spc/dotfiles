{ pkgs, ... }:
{
  imports = [
    ./programs
    ./themes
  ];

  home.packages = with pkgs; [
    dunst
    pavucontrol
    xdg-utils
    tokyonight-gtk-theme
    playerctl
    pamixer
    brightnessctl
    wl-clipboard
    nautilus
    ripdrag
    slurp
    wf-recorder
    wf-recorder-toggle
  ];

  services = {
    kdeconnect = {
      enable = true;
      package = pkgs.kdePackages.kdeconnect-kde;
      indicator = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/about" = "zen-beta.desktop";
      "x-scheme-handler/unknown" = "zen-beta.desktop";
    };
  };

  xdg.portal = {
    enable = true;
    config = {
      common.default = [ "gnome" ];
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
    ];
  };
}
