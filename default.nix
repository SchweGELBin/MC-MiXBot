{ buildNpmPackage, lib }:

buildNpmPackage (finalAttrs: {
  pname = "mixbot";
  version = "0.1.0";

  src = ./.;
  npmDepsHash = "sha256-ayKfROiMqNei9FJgOzYQkS22qjP9evBdQjX1lbfy92I=";

  meta = {
    description = "Minecraft MiXBot";
    homepage = "https://github.com/SchweGELBin/MC-MiXBot";
    changelog = "https://github.com/SchweGELBin/MC-MiXBot/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
