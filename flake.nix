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
      in {
        packages.default = pkgs.python3.pkgs.buildPythonApplication {
          pname = "pyfetch";
          version = "1.2.0";
          src = ./.;
          format = "pyproject";

          propagatedBuildInputs = with pkgs.python3.pkgs; [
            psutil
            colorama
          ];

          # No special handling needed for _pyfetch
          pythonImportsCheck = ["_pyfetch"];
        };
      });
}
