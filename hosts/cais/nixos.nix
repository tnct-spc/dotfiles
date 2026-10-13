{
  inputs,
  pkgs,
  ...
}:
let
  users = [
    {
      username = "procon";
      hashedPassword = "$6$8hFdyawkKpPjCu0T$CH1UjkJ6bqujsXVRNY0HxNeUPZFsE2v8CdzkQXnOVLfC3tQF1T6sMzU0Hg/aPgp9BUgPkUAxKM77.1PHZqG6b/";
    }
  ];
  primaryUser = builtins.elemAt (builtins.filter (user: user.username == "procon") users) 0;
  hostname = "cais";
in
{
  imports = [
    ./hardware-configuration.nix
    (import ../nixos.nix hostname)
    ./onstage-wired.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "joydev" ];
    tmp.useTmpfs = true;
    kernelParams = [ "amd_pstate=active" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  users.users = {
    root = {
      inherit (primaryUser) hashedPassword;
      shell = pkgs.zsh;
    };
  }
  // builtins.listToAttrs (
    map (user: {
      name = user.username;
      value = {
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [
          "networkmanager"
          "wheel"
          "audio"
          "video"
          "input"
        ];
        inherit (user) hashedPassword;
      };
    }) users
  );

  nix.settings.trusted-users = map (user: user.username) users;

  console = {
    enable = false;
    keyMap = "jp106";
  };

  i18n.defaultLocale = "ja_JP.UTF-8";

  fonts = {
    fontconfig.enable = true;
    packages = [ pkgs.sarasa-gothic ];
  };


  services = {
    kmscon = {
      enable = true;
      config = {
        font-engine = "pango";
        font-name = "Sarasa Term J";
        font-size = 16;
        dpms-timeout = 0;
        mouse = false;
        xkb-layout = "jp";
      };
    };
    tailscale.enable = true;
    thermald.enable = true;
    asusd.enable = true;
    logind.settings.Login = {
      HandleLidSwitch = "ignore";
      HandleLidSwitchExternalPower = "ignore";
      HandleLidSwitchDocked = "ignore";
    };
  };

  hardware.graphics = {
    enable = false;
  };

  system.stateVersion = "26.05";

  environment.systemPackages = with pkgs; [
    git
    linuxPackages_latest.cpupower
    btop
    neovim
    yazi
    asusctl
    lazygit
  ];
}
