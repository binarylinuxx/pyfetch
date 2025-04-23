from setuptools import setup, find_packages

setup(
    name="pyfetch",
    version="1.2.0",  # Обновите по необходимости
    author="Nir Rudov",
    description="Minimalist system info tool in Python",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/binarylinuxx/pyfetch",
    packages=find_packages(),
    install_requires=[
        "psutil>=5.8.0",  # Основная зависимость
        "colorama",
        "setuptools",     # Для сборки
    ],
    python_requires=">=3.6",
    entry_points={
        "console_scripts": [
        "pyfetch = pyfetch:main",  # Changed from 'pyfetch:main'
    ],
   },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: POSIX :: Linux",
    ],
)
