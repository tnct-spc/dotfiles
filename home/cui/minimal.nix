{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ ./programs/minimal.nix ];

  home.packages =
    (with pkgs; [
      curl
      bat
      git
      lazygit
      unzip
      wget
      eza
      zoxide
      ripgrep
      any-nix-shell
    ])
    ++ [ inputs.nvf.packages."${pkgs.stdenv.hostPlatform.system}".default ];
}
