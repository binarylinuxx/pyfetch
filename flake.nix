{
  description = "Minimalist system info tool in Python";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python-with-packages = pkgs.python3.withPackages (ps: [
          ps.psutil
          ps.colorama
        ]);
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "pyfetch";
          version = "1.2.0";
          src = ./.;
          
          buildInputs = [ python-with-packages ];
          
          installPhase = ''
            mkdir -p $out/bin
            cp ${./pyfetch.py} $out/bin/pyfetch
            chmod +x $out/bin/pyfetch
            patchShebangs $out/bin/pyfetch
          '';
        };

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/pyfetch";
        };

        devShell = pkgs.mkShell {
          packages = [ python-with-packages ];
        };
      });
}
