{
  "Mod+Shift+Slash".action.show-hotkey-overlay = { };

  "Mod+Return".action.spawn = "kitty";
  "Mod+D".action.spawn = "fuzzel";
  "Mod+T".action.spawn = "wleave";
  "Mod+B".action.spawn = [
    "pkill"
    "-SIGUSR1"
    "waybar"
  ];

  "Mod+C".action.close-window = { };
  "Mod+W".action.toggle-column-tabbed-display = { };
  "Mod+V".action.toggle-window-floating = { };
  "Mod+R".action.switch-preset-column-width = { };
  "Mod+E".action.switch-preset-window-height = { };
  "Mod+Shift+E".action.reset-window-height = { };
  "Mod+F".action.maximize-column = { };
  "Mod+G".action.fullscreen-window = { };
  "Mod+Comma".action.consume-window-into-column = { };
  "Mod+Period".action.expel-window-from-column = { };

  "Mod+Left".action.focus-column-or-monitor-left = { };
  "Mod+Down".action.focus-window-or-monitor-down = { };
  "Mod+Up".action.focus-window-or-monitor-up = { };
  "Mod+Right".action.focus-column-or-monitor-right = { };
  "Mod+H".action.focus-column-or-monitor-left = { };
  "Mod+J".action.focus-window-or-workspace-down = { };
  "Mod+K".action.focus-window-or-workspace-up = { };
  "Mod+L".action.focus-column-or-monitor-right = { };

  "Mod+Shift+Left".action.move-column-left-or-to-monitor-left = { };
  "Mod+Shift+Down".action.move-window-down-or-to-workspace-down = { };
  "Mod+Shift+Up".action.move-window-up-or-to-workspace-up = { };
  "Mod+Shift+Right".action.move-column-to-monitor-right = { };
  "Mod+Shift+H".action.move-column-left-or-to-monitor-left = { };
  "Mod+Shift+J".action.move-window-down-or-to-workspace-down = { };
  "Mod+Shift+K".action.move-window-up-or-to-workspace-up = { };
  "Mod+Shift+L".action.move-column-right-or-to-monitor-right = { };

  "Mod+Ctrl+Left".action.consume-or-expel-window-left = { };
  "Mod+Ctrl+Right".action.consume-or-expel-window-right = { };
  "Mod+Ctrl+H".action.consume-or-expel-window-left = { };
  "Mod+Ctrl+L".action.consume-or-expel-window-right = { };

  "Mod+WheelScrollDown" = {
    cooldown-ms = 150;
    action.focus-workspace-down = { };
  };
  "Mod+WheelScrollUp" = {
    cooldown-ms = 150;
    action.focus-workspace-up = { };
  };
  "Mod+Ctrl+WheelScrollDown" = {
    cooldown-ms = 150;
    action.move-column-to-workspace-down = { };
  };
  "Mod+Ctrl+WheelScrollUp" = {
    cooldown-ms = 150;
    action.move-column-to-workspace-up = { };
  };

  "Mod+WheelScrollRight".action.focus-column-right = { };
  "Mod+WheelScrollLeft".action.focus-column-left = { };
  "Mod+Ctrl+WheelScrollRight".action.move-column-right = { };
  "Mod+Ctrl+WheelScrollLeft".action.move-column-left = { };

  "Mod+Shift+WheelScrollDown".action.focus-column-right = { };
  "Mod+Shift+WheelScrollUp".action.focus-column-left = { };
  "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = { };
  "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = { };

  "Mod+1".action.focus-workspace = 1;
  "Mod+2".action.focus-workspace = 2;
  "Mod+3".action.focus-workspace = 3;
  "Mod+4".action.focus-workspace = 4;
  "Mod+5".action.focus-workspace = 5;
  "Mod+6".action.focus-workspace = 6;
  "Mod+7".action.focus-workspace = 7;
  "Mod+8".action.focus-workspace = 8;
  "Mod+9".action.focus-workspace = 9;
  "Mod+Ctrl+1".action.move-column-to-workspace = 1;
  "Mod+Ctrl+2".action.move-column-to-workspace = 2;
  "Mod+Ctrl+3".action.move-column-to-workspace = 3;
  "Mod+Ctrl+4".action.move-column-to-workspace = 4;
  "Mod+Ctrl+5".action.move-column-to-workspace = 5;
  "Mod+Ctrl+6".action.move-column-to-workspace = 6;
  "Mod+Ctrl+7".action.move-column-to-workspace = 7;
  "Mod+Ctrl+8".action.move-column-to-workspace = 8;
  "Mod+Ctrl+9".action.move-column-to-workspace = 9;

  "Mod+Minus".action.set-column-width = "-10%";
  "Mod+Equal".action.set-column-width = "+10%";

  "Mod+Shift+Minus".action.set-window-height = "-10%";
  "Mod+Shift+Equal".action.set-window-height = "+10%";

  "Print".action.screenshot = { };
  "Ctrl+Print".action.screenshot-screen = {
    write-to-disk = false;
  };
  "Alt+Print".action.screenshot-window = {
    write-to-disk = false;
  };
  "Mod+S".action.spawn-sh = [
    "wf-recorder-toggle -f \"$HOME/Videos/wf-recorder/$(date +%F-%H-%M-%S).mp4\""
  ];

  "XF86AudioRaiseVolume" = {
    allow-when-locked = true;
    action.spawn = [
      "wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.05+"
    ];
  };
  "XF86AudioLowerVolume" = {
    allow-when-locked = true;
    action.spawn = [
      "wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.05-"
    ];
  };
  "XF86MonBrightnessUp" = {
    allow-when-locked = true;
    action.spawn = [
      "brightnessctl"
      "set"
      "5%+"
    ];
  };
  "XF86MonBrightnessDown" = {
    allow-when-locked = true;
    action.spawn = [
      "brightnessctl"
      "set"
      "5%-"
    ];
  };
  "XF86AudioMute" = {
    allow-when-locked = true;
    action.spawn = [
      "wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SINK@"
      "toggle"
    ];
  };
  "XF86AudioMicMute" = {
    allow-when-locked = true;
    action.spawn = [
      "wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SOURCE@"
      "toggle"
    ];
  };
}
