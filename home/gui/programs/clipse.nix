{
  services.clipse = {
    enable = true;
    settings = {
      enableDescription = false;
      imageDisplay.type = "kitty";
      keyBindings = {
        "up" = "k";
        "down" = "j";
      };
    };
  };

  systemd.user.services.clipse.Service.UMask = "0077";
}
