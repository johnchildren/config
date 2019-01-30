{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "libpg_query-${version}";
  version = "9.5-1.4.2";

  installPhase = ''
    mkdir -p $out/lib $out/include
    cp libpg_query.a $out/lib
    cp pg_query.h $out/include
  '';

  src = fetchFromGitHub {
    owner  = "lfittl";
    repo   = "libpg_query";
    rev    = version;
    sha256 = "0jd6c2ykfm1a32my4a6lqlvsk8flxjh2ma3rp1fxrzygzyinz4l3";
  };
}
