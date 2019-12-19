{ lib, clangStdenv, fetchFromGitHub, idris-latest }:

clangStdenv.mkDerivation rec {
  name = "idris2-${version}";
  version = "unstable-2019-07-10";

  src = fetchFromGitHub {
    owner = "edwinb";
    repo = "Idris2";
    rev = "9f9460603755e74eeb8dc3116438408a802f5234";
    sha256 = "0nxvrvib5nynlvizg2p8zhg12jdl4k84wp8gj7g7addi6ij37b5k";
  };

  buildInputs = [ idris-latest ];

  meta = with lib; {
    description = "Pre-alpha implementation of Idris 2, the successor to Idris.";
    homepage = https://github.com/edwinb/Idris2;
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
