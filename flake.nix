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

          # Explicitly specify the package directory
          pyproject = true;
          pythonImportsCheck = [ ".pyfetch" ];

          propagatedBuildInputs = with python.pkgs; [
            psutil
            colorama
            setuptools
          ];

          # Fix for hidden module directory
          preBuild = ''
            export PYTHONPATH=$PYTHONPATH:${builtins.toString ./.}
          '';

          meta = with pkgs.lib; {
            description = "Minimalist system info tool in Python";
            homepage = "https://github.com/binarylinuxx/pyfetch";
            license = licenses.mit;
          };
        };
      });
}
