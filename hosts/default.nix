inputs:
let
  mkNixosSystem =
    {
      system,
      modules,
      cudaSupport ? false,
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          inherit cudaSupport;
        };
        overlays = [
          inputs.nur-yadokani.overlays.nur
        ];
      };
      inherit modules;
    };
in
{
  nixosConfigurations = {
    cais = mkNixosSystem {
      system = "x86_64-linux";
      modules = [ ./cais/nixos.nix ];
    };
  };
}
