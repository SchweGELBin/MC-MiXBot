{ lib, rustPlatform }:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "mixbot";
  version = "0.2.0";

  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;

  env.RUSTC_BOOTSTRAP = 1;

  meta = {
    description = "Minecraft MiXBot";
    homepage = "https://github.com/SchweGELBin/MC-MiXBot";
    changelog = "https://github.com/SchweGELBin/MC-MiXBot/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
