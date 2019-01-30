{ llvmPackages_5, fetchgit, git, python }:
llvmPackages_5.stdenv.mkDerivation rec {
  name = "cquery-v${version}";
  version = "2018-02-13";

  nativeBuildInputs = [ git python ];
  buildInputs = with llvmPackages_5; [ clang clang.cc ];
  configurePhase = ''
    ./waf configure --prefix=$out \
                    --llvm-config= \
                    --clang-prefix=${llvmPackages_5.clang.cc} \
  '';
  buildPhase = ''
    ./waf build
  '';
  installPhase = ''
    ./waf install
  '';

  src = fetchgit {
    url = "https://github.com/cquery-project/cquery";
    rev = "5540eb1ecc2e85be61bba6b68641f2568c936d0c";
    sha256 = "1xrc854n4v5rs9ync2n0iw34rlxl08xw26pk7svpgnszdifpxj1z";
    fetchSubmodules = true;
  };
}
