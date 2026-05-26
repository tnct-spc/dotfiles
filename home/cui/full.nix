{ pkgs, ... }:
{
  imports = [
    ./minimal.nix
    ./programs/full.nix
  ];

  home = {
    packages = with pkgs; [
      gh
      cava
      tdf
      mold-unwrapped
      jq
      uv
      nodejs
      fd
      unar
      evcxr
      cloudflared
      ffmpeg
      python3
      imagemagick
      ghostscript
      cachix
    ];
  };
}
