{ inputs, pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = [
        inputs.kanaemi.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
      settings = {
        globalOptions = {
          Hotkey = {
            TriggerKeys = "";
            ActivateKeys = "";
            DeactivateKeys = "";
            AltTriggerKeys = "";
            EnumerateGroupForwardKeys = "";
            EnumerateGroupBackwardKeys = "";
          };
          Behavior.ActiveByDefault = true;
        };
        inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "jp";
            DefaultIM = "kanaemi";
          };
          "Groups/0/Items/0" = {
            Name = "keyboard-jp";
            Layout = null;
          };
          "Groups/0/Items/1" = {
            Name = "kanaemi";
            Layout = null;
          };
        };
      };
    };
  };

  xdg.configFile.fcitx5 = {
    recursive = true;
    force = true;
  };

  xdg.configFile = {
    "kanaemi/config.toml".text = ''
      [romaji]
      tables = ["full-width", "hepburn", "kunrei", "input-aids", "z-symbols", "azik", "azik-custom.tsv", "half-width-digits.tsv"]

      [keys]
      pass_while_composing = ["ctrl"]

      [keys.reading]
      "ctrl+a" = "@none"
      "ctrl+k" = "@commit-katakana"

      [keys.candidates]
      "ctrl+k" = "@commit-katakana"

      [keys.registration]
      "ctrl+a" = "@none"

      [keys.application.linux]
      "ctrl+a" = "@none"
    '';
    "kanaemi/romaji/azik-custom.tsv".text = ''
      l	っ
    '';
    "kanaemi/romaji/half-width-digits.tsv".text = ''
      0	0
      1	1
      2	2
      3	3
      4	4
      5	5
      6	6
      7	7
      8	8
      9	9
    '';
    "kanaemi/dictionaries/kanaemi-base.tsv".source = "${inputs.kanaemi-dict}/dictionaries/base.tsv";
    "kanaemi/dictionaries/kanaemi-2026.tsv".source = "${inputs.kanaemi-dict}/dictionaries/2026.tsv";
    "kanaemi/dictionaries/kanaemi-games.tsv".source = "${inputs.kanaemi-dict}/dictionaries/games.tsv";
    "kanaemi/dictionaries/kanaemi-it.tsv".source = "${inputs.kanaemi-dict}/dictionaries/it.tsv";
    "kanaemi/dictionaries/kanaemi-place.tsv".source = "${inputs.kanaemi-dict}/dictionaries/place.tsv";
    "kanaemi/dictionaries/kanaemi-science.tsv".source =
      "${inputs.kanaemi-dict}/dictionaries/science.tsv";
    "kanaemi/dictionaries/kanaemi-symbol.tsv".source = "${inputs.kanaemi-dict}/dictionaries/symbol.tsv";
    "kanaemi/ranking.model".source = "${inputs.kanaemi-dict}/dictionaries/base.model";
  };
}
