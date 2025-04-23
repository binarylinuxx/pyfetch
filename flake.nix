pyfetch = python.pkgs.buildPythonPackage {
  pname = "pyfetch";
  version = "1.2.0";
  src = ./.;
  
  # Add this to specify the package is in the pyfetch directory
  pyproject = true;
  
  nativeBuildInputs = with python.pkgs; [ setuptools ];
  propagatedBuildInputs = with python.pkgs; [
    psutil
    colorama
  ];

  doCheck = false;
  pythonImportsCheck = [ "pyfetch" ];
};
