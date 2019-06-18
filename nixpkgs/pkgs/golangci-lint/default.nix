{ buildGoPackage, fetchFromGitHub, lib }:

buildGoPackage rec {
  name = "golangci-lint-${version}";
  version = "1.15.0";
  goPackagePath = "github.com/golangci/golangci-lint";

  subPackages = [ "cmd/golangci-lint" ];

  src = fetchFromGitHub {
    owner = "golangci";
    repo = "golangci-lint";
    rev = "v${version}";
    sha256 = "0jq434hq56xb7r7pdjykxx8jxr107djzk24dwzhjs9ynqfdv9k4v";
  };

  meta = with lib; {
    description = "Linters Runner for Go. 5x faster than gometalinter. Nice colored output.";
    homepage = https://golangci.com/;
    license = licenses.agpl3;
    platforms = platforms.unix;
    maintainers = [ maintainers.manveru ];
  };
}
