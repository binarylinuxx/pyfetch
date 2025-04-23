{
  description = "Minimalist system info tool in Python";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python3;
      in {
        packages.default = python.pkgs.buildPythonPackage {
          pname = "pyfetch";
          version = "1.2.0";
          src = ./.;
          format = "pyproject";

          nativeBuildInputs = with python.pkgs; [
            setuptools
            wheel
          ];

          propagatedBuildInputs = with python.pkgs; [
            psutil
            colorama
          ];

          # For _pyfetch package structure
          pythonImportsCheck = ["_pyfetch"];
        };
      });
}
