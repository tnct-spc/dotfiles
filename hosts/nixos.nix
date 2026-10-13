hostname:
{ pkgs, ... }:
{
  time.timeZone = "Asia/Tokyo";

  security.rtkit.enable = true;

  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      histSize = 10000;
      setOptions = [
        "AUTO_CD"
        "HIST_IGNORE_DUPS"
        "HIST_IGNORE_SPACE"
        "SHARE_HISTORY"
      ];
      shellAliases = {
        c = "clear";
        la = "ls -A";
        ll = "ls -lh";
      };
      interactiveShellInit = ''
        autoload -Uz vcs_info
        zstyle ':vcs_info:git:*' formats ' (%b)'
        precmd() { vcs_info }
        setopt PROMPT_SUBST
        PROMPT='%F{cyan}%~%f''${vcs_info_msg_0_} %# '
      '';
    };

    dconf.enable = true;
    nix-ld.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    hostName = hostname;
    firewall.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    uinput.enable = true;
  };

  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", TAG+="uaccess"
  '';

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
    ];
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    baobab # disk usage analyzer
    cheese # photo booth
    epiphany # web browser
    gedit # text editor
    orca # screen reader
    simple-scan # document scanner
    yelp # help viewer
    file-roller # archive manager
    geary # email client
    seahorse # password manager

    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-photos
    gnome-weather
  ];
}
