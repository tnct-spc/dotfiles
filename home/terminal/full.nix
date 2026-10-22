{ pkgs, ... }:
{
  imports = [
    ./minimal.nix
    ../development/nix-index.nix
  ];

  home.packages = with pkgs; [
    cachix
    cava
    cloudflared
    evcxr
    ffmpeg
    fd
    gh
    ghostscript
    imagemagick
    jq
    mold-unwrapped
    nodejs
    python3
    tdf
    unar
    uv
  ];
}
