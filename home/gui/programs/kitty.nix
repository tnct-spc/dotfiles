{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      # vim:ft=kitty

      #zshell
      shell zsh

      # Remove close window confirm
      confirm_os_window_close 0

      font_size 12.0

      map ctrl+shift+; change_font_size all +2.0

      scrollback_pager nvim -c "setlocal autowriteall" -c "silent write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "

      background_opacity 0.9
      background_blur 0

      allow_remote_control yes
      dynamic_background_opacity yes

      # The basic colors
      foreground              #CDD6F4
      background              #282A36

      # Cursor colors
      cursor                  #F8F8F2
      cursor_text_color       #1E1E2E

      # URL underline color when hovering with mouse
      url_color               #F5E0DC

      # Kitty window border colors
      active_border_color     #B4BEFE
      inactive_border_color   #6C7086
      bell_border_color       #F9E2AF

      # OS Window titlebar colors
      wayland_titlebar_color system
      macos_titlebar_color system

      # Tab bar colors
      active_tab_foreground   #11111B
      active_tab_background   #CBA6F7
      inactive_tab_foreground #CDD6F4
      inactive_tab_background #181825
      tab_bar_background      #11111B

      # Colors for marks (marked text in the terminal)
      mark1_foreground #1E1E2E
      mark1_background #B4BEFE
      mark2_foreground #1E1E2E
      mark2_background #CBA6F7
      mark3_foreground #1E1E2E
      mark3_background #74C7EC

      # The 16 terminal colors

      # black
      color0 #44475A
      color8 #6272A4

      # red
      color1 #FF5555
      color9 #FF6E6E

      # green
      color2  #50fa7b
      color10 #69FF94

      # yellow
      color3  #F1FA8C
      color11 #FFFFA5

      # blue
      color4  #BD93F9
      color12 #D6ACFF

      # magenta
      color5  #FF79C6
      color13 #FF92DF

      # cyan
      color6  #94E2D5
      color14 #A4FFFF

      # white
      color7  #F8F8F2
      color15 #FFFFFF
    '';
  };
}
