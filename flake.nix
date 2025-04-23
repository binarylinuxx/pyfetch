pyfetch = python.pkgs.buildPythonPackage {
  pname = "pyfetch";
  version = "1.2.0";
  src = ./.;
  
  format = "pyproject";  # Changed from pyproject = true;
  
  nativeBuildInputs = with python.pkgs; [ setuptools ];
  propagatedBuildInputs = with python.pkgs; [
    psutil
    colorama
  ];

  doCheck = false;
  pythonImportsCheck = [ "pyfetch" ];
};
