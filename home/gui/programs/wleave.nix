{ pkgs, ... }:
{
  programs.wleave = {
    enable = true;
    settings = {
      buttons-per-row = "2";
      close-on-lost-focus = true;
      no-version-info = true;
      buttons = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
          icon = "${pkgs.wleave}/share/wleave/icons/lock.svg";
        }
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "Logout";
          keybind = "e";
          icon = "${pkgs.wleave}/share/wleave/icons/logout.svg";
        }
        {
          label = "reboot";
          action = "reboot";
          text = "Reboot";
          keybind = "r";
          icon = "${pkgs.wleave}/share/wleave/icons/reboot.svg";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
          icon = "${pkgs.wleave}/share/wleave/icons/shutdown.svg";
        }
      ];
    };
  };
}
