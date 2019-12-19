{ stdenv, rustPlatform, fetchFromGitHub, pkgconfig, openssl }:

rustPlatform.buildRustPackage rec {
  name = "scdlang-${version}";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "DrSensor";
    repo = "scdlang";
    rev = version;
    sha256 = "09zf2inc27832kcm52v101v2a48w03an370z87znsar8xia2ds6k";
  };

  doCheck = false;
  buildInputs = [ pkgconfig ];

  cargoSha256 = "1zni2q6ydxacdy07sdy2z71yljh6rcn8anpk9jca7v2dpmq2cqwy";

  meta = with stdenv.lib; {
    description = "Statecharts Description Language";
    homepage = https://elba.pub;
    license = licenses.upl;
    maintainers = [ maintainers.johnchildren ];
    platforms = platforms.all;
  };
}
