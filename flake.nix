{
  description = "mixbot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      fenix,
      nixpkgs,
    }:
    let
      inherit (nixpkgs) lib;
      systems = lib.systems.flakeExposed;
      eachSystem = lib.genAttrs systems;
    in
    {
      packages = eachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          mixbot = pkgs.callPackage ./. { fenix = fenix.packages.${system}; };
          default = pkgs.callPackage ./. { fenix = fenix.packages.${system}; };
        }
      );
    };
}
