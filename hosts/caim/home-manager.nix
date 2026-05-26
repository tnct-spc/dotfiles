username:
{
  pkgs,
  ...
}:
{
  imports = [
    ../../home/gui/home.nix
    ../../home/cui/full.nix
  ];

  programs = {
    home-manager.enable = true;

    niri.settings = {
      input.keyboard.xkb.layout = "jp";
      binds = {
        "Mod+U".action.focus-workspace-down = { };
        "Mod+I".action.focus-workspace-up = { };
      };
    };

    git.settings.user = {
      name = "yadokani389";
      email = "yadokani389@gmail.com";
    };
  };

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    packages = with pkgs; [
      nvtopPackages.intel
      btop
    ];

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "zen";
      TERMINAL = "kitty";
    };
  };
}
