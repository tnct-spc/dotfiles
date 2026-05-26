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
    caim = mkNixosSystem {
      system = "x86_64-linux";
      modules = [ ./caim/nixos.nix ];
    };
  };
}
