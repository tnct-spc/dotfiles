{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = false;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "~/wallpapers/blender.png";
        }
      ];

      input-field = [
        {
          size = "300, 50";

          outline_thickness = 1;

          fade_on_empty = false;
          placeholder_text = "Password...";

          dots_spacing = 0.2;
          dots_center = true;
        }
      ];

      label = [
        {
          text = "$TIME";
          font_size = 50;

          position = "0, 150";

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
