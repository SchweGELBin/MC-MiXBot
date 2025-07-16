{
  fenix ? import (fetchTarball "https://github.com/nix-community/fenix/archive/monthly.tar.gz") { },
  lib,
  pkgs,
}:

let
  rustToolchain =
    with fenix;
    combine [
      minimal.toolchain
      targets.aarch64-unknown-linux-gnu.minimal.rust-std
      targets.x86_64-unknown-linux-gnu.minimal.rust-std
    ];
  rustNightly = pkgs.makeRustPlatform {
    cargo = rustToolchain;
    rustc = rustToolchain;
  };
in

rustNightly.buildRustPackage (finalAttrs: {
  pname = "mixbot";
  version = "0.3.0";

  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;

  meta = {
    description = "Minecraft MiXBot";
    homepage = "https://github.com/SchweGELBin/MC-MiXBot";
    changelog = "https://github.com/SchweGELBin/MC-MiXBot/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
