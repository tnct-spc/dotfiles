{
  inputs,
  pkgs,
  ...
}:
let
  users = [
    {
      username = "procon-server";
      hashedPassword = "$6$8hFdyawkKpPjCu0T$CH1UjkJ6bqujsXVRNY0HxNeUPZFsE2v8CdzkQXnOVLfC3tQF1T6sMzU0Hg/aPgp9BUgPkUAxKM77.1PHZqG6b/";
    }
    {
      username = "kani";
      hashedPassword = "$6$xzVNYSD7yHJuO./x$5fCLN3.ENzMJDWkgegYazIgw/NkWYC2jMSiTDqma84wjEhbYRgeDPcHb.nc55WPD3qpACqGakvM4kXHZihgly0";
    }
  ];
  primaryUser = builtins.elemAt (builtins.filter (user: user.username == "procon-server") users) 0;
  hostname = "caim";
in
{
  imports = [
    ./hardware-configuration.nix
    (import ../nixos.nix hostname)
    ../desktop

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users = builtins.listToAttrs (
          map (user: {
            name = user.username;
            value = import ./home-manager.nix user.username;
          }) users
        );
        extraSpecialArgs = { inherit inputs; };
      };
    }
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "joydev" ];
    tmp.useTmpfs = true;
    kernel.sysctl."net.ipv4.ip_forward" = 1;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  users.users = {
    root = {
      inherit (primaryUser) hashedPassword;
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

  console.keyMap = "jp106";

  services = {
    tailscale.enable = true;
    thermald.enable = true;
    openssh.enable = true;
    xserver.xkb = {
      layout = "jp";
      model = "jp106";
    };

    desktopManager.gnome.enable = true;

    rustdesk-server = {
      enable = true;
      openFirewall = true;
      signal.relayHosts = [ "100.120.100.93" ];
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt

      intel-compute-runtime
    ];
  };

  programs = {
    niri.enable = true;
  };

  system.stateVersion = "26.05";
}
