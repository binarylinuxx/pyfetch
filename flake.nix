{
  description = "PyFetch - Minimalist system info tool";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pythonEnv = pkgs.python3.withPackages (ps: [
          ps.psutil
          ps.colorama
          ps.distro  # Добавляем недостающую зависимость
        ]);
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "pyfetch";
          version = "1.0.0";
          src = ./.;
          
          nativeBuildInputs = [ pkgs.makeWrapper ];
          buildInputs = [ pythonEnv ];
          
          installPhase = ''
            mkdir -p $out/bin
            install -Dm755 ${./pyfetch.py} $out/bin/pyfetch
            wrapProgram $out/bin/pyfetch \
              --prefix PATH : ${pkgs.lib.makeBinPath [ pythonEnv ]}
          '';
        };

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/pyfetch";
        };

        devShells.default = pkgs.mkShell {
          packages = [ pythonEnv ];
        };
      });
}
