{ stdenv, fetchFromGitHub, jdk, leiningen }:

stdenv.mkDerivation rec {
  version = "20180531T032130";
  name = "clojure-lsp-${version}";

  src = fetchFromGitHub {
    owner = "snoe";
    repo = "clojure-lsp";
    rev = "a0e88709e0d81d685681521146569c9d2c4b8bb9";
    sha256 = "0nmrvafz872050akjsc4c3rbylw8j7ma4sm78rfqf3mnnqaijrpg";
  };

  builder = ./builder.sh;

  buildInputs = [ leiningen ];
  propagatedBuildInputs = [ jdk ];
}
