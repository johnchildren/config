{ stdenv, rustPlatform, fetchFromGitHub, pkgconfig, openssl }:

rustPlatform.buildRustPackage rec {
  name = "elba-${version}";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "elba";
    repo = "elba";
    rev = version;
    sha256 = "0rq33ygmwfpbj9wq7vq42xwqxbkd3dycnclqchwxh65wlwwaj9r4";
  };

  buildInputs = [ pkgconfig openssl ];

  cargoSha256 = "159g81mnb78pj69xgnjhjfdvb08yqgsxsm76gdqylvfspamfbfvv";

  meta = with stdenv.lib; {
    description = "A package manager for Idris";
    homepage = https://elba.pub;
    license = licenses.mit;
    maintainers = [ maintainers.johnchildren ];
    platforms = platforms.all;
  };
}
