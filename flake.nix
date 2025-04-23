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
        python = pkgs.python311;
      in {
        packages.default = python.pkgs.buildPythonPackage {
          pname = "pyfetch";
          version = "1.2.0";
          src = ./.;
          format = "pyproject";
          propagatedBuildInputs = with python.pkgs; [
            psutil
            colorama
          ];
        };

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/pyfetch";
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            python
            python.pkgs.psutil
            python.pkgs.colorama
          ];
        };
      });
}
