{ stdenv, python37Packages, fetchFromGitHub }:

python37Packages.buildPythonApplication rec {
  pname = "legere";
  version = "unstable-2019-06-25";

  src = fetchFromGitHub {
    owner = "borntyping";
    repo = "legere";
    rev = "d693f1c07a086eaa5e4cc1d90bee674342d5a8f4";
    sha256 = "1rfvqb7zjr1apjxn0dmz46bj900q8nc3q6nm0lr1l8i2sqr36s5k";
  };

  propagatedBuildInputs = with python37Packages; [
    click pyyaml
  ];

  meta = with stdenv.lib; {
    homepage = https://github.com/borntyping/legere;
    description = "A human readable formatter for JSON logs.";
    license = licenses.mit;
    maintainers = with maintainers; [ johnchildren ];
  };
}
