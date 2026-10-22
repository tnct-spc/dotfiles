{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./git.nix
    ./zsh
  ];

  home.packages = with pkgs; [
    any-nix-shell
    bat
    curl
    eza
    git
    lazygit
    ripgrep
    unzip
    wget
    zoxide
    inputs.nvf.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];
}
