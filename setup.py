from setuptools import setup
from pathlib import Path

# Current directory
here = Path(__file__).parent

# Get long description from README.md
try:
    long_description = (here / "README.md").read_text(encoding="utf-8")
except FileNotFoundError:
    long_description = "Minimalist system info tool in Python"

setup(
    name="pyfetch",
    version="1.2.0",
    author="Nir Rudov",
    description="Minimalist system info tool in Python",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/binarylinuxx/pyfetch",
    packages=["_pyfetch"],
    package_dir={"": "."},
    install_requires=[
        "psutil>=5.8.0",
        "colorama",
    ],
    python_requires=">=3.6",
    entry_points={
        "console_scripts": [
            "pyfetch = pyfetch.pyfetch:main",  # Corrected entry point
     ],
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: POSIX :: Linux",
    ],
)
