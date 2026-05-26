{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Yaru-magenta-dark";
      package = pkgs.yaru-theme;
    };

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    gtk4.theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    font = {
      name = "Noto Sans CJK JP";
      package = pkgs.noto-fonts-cjk-sans;
    };
  };
}
