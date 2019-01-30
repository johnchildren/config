{ pkgs }:
pkgs.python36.withPackages(pythonPackages:
  with pythonPackages; [
    #python-language-server
    #pyls-isort
    #pyls-mypy
  ]
)
