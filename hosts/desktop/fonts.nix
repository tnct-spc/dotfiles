{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages =
      (with pkgs; [
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        noto-fonts-monochrome-emoji
        twemoji-color-font
        fira-code-symbols
      ])
      ++ (with pkgs.nerd-fonts; [
        fira-code
        noto
      ]);
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Emoji"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Emoji"
        ];
        monospace = [
          "FiraCode Nerd Font"
          "Noto Sans CJK JP"
          "Noto Emoji"
        ];
        emoji = [ "Noto Emoji" ];
      };
    };
  };
}
