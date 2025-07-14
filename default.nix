{ lib, rustPlatform }:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "mixbot";
  version = "0.0.1";

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
