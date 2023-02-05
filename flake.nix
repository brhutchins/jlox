{
  description = "dev environment for lox";

  inputs.nixpkgs.url = "nixpkgs/nixos-22.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
      rec {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            jdk11
            java-language-server
          ];

          shellHook = ''
            export JAVA_HOME=${pkgs.jdk11}
          '';
        };
      }
    );
}
