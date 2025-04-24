{
  description = "Minimalist system info tool in Python - pyfetch";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        python = pkgs.python3;
        pyfetch = python.pkgs.buildPythonPackage {
          pname = "pyfetch";
          version = "1.2.0";

          src = ./.;

          nativeBuildInputs = with python.pkgs; [ setuptools ];
          propagatedBuildInputs = with python.pkgs; [
            psutil
            colorama
          ];

          doCheck = false;  # Set to true if you want to run tests
          pythonImportsCheck = [ "pyfetch" ];
        };
      in {
        packages.default = pyfetch;
        apps.default = {
          type = "app";
          program = "${pyfetch}/bin/pyfetch";
        };
        devShells.default = pkgs.mkShell {
          buildInputs = [ python pkgs.python3Packages.psutil pkgs.python3Packages.colorama ];
        };
      }
    );
}
