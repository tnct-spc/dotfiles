# Onstage wired setup approved 2026-10-07.
# Apply through NixOS after reviewing the unrelated current dotfiles changes.
{ ... }:
{
  networking.networkmanager.ensureProfiles.profiles.onstage-wired = {
    connection = {
      id = "onstage-wired";
      uuid = "67c455ab-0de4-46d6-9332-8c53c58c0ac2";
      type = "ethernet";
      interface-name = "enp3s0";
      autoconnect = true;
      autoconnect-priority = 100;
    };
    # 2026-10-08: 会場の有線 LAN の IP (DHCP) と、3 台用の固定 10.55.0.3 の両方。DHCP が無くても 10.55.0.3 は付ける
    ipv4 = {
      method = "auto";
      address1 = "10.55.0.3/24";
      may-fail = true;
      never-default = true;
      ignore-auto-dns = true;
    };
    ipv6.method = "link-local";
  };

  # 2026-10-08 (人間「多少危なくてもどんな状況でも通信できるように」): 有線からなら送り元を問わず ssh と mDNS を通す
  networking.firewall.interfaces.enp3s0.allowedTCPPorts = [ 22 ];
  networking.firewall.interfaces.enp3s0.allowedUDPPorts = [ 5353 ];

  services.openssh = {
    enable = true;
    openFirewall = false;
    hostKeys = [
      {
        type = "ed25519";
        path = "/root/mame/wired-setup/ssh_host_ed25519_key";
      }
    ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "prohibit-password";
      AuthenticationMethods = "publickey";
      AllowUsers = [ "root" ];
    };
  };

  services.avahi = {
    enable = true;
    allowInterfaces = [ "enp3s0" ];
    ipv4 = true;
    ipv6 = false;
    openFirewall = false;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      userServices = false;
    };
  };

  # Normal root shell from the wired ROG only; forwarding stays disabled.
  # Existing ROG public-key fingerprint: SHA256:hWRxFmZZxWczyA6nudyVWHUBqgtuuC0kqWclbNhzTpc
  users.users.root.openssh.authorizedKeys.keys = [
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILHA9qXMXq9uXHbhMeUgoqCS9A0ZM6318j0zDxshpBQm mame@rog-ubuntu''
  ];
}
