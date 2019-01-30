{ stdenv, buildGoPackage, fetchgit }:

buildGoPackage rec {
  name = "go-langserver-${version}";
  version = "unstable-2018-05-29";
  rev = "7b8acaa20dd8db659a31520d95ae74afe0e43499";

  goPackagePath = "github.com/sourcegraph/go-langserver";
  subPackages = [ "." ];

  src = fetchgit {
    inherit rev;
    url = "https://github.com/sourcegraph/go-langserver.git";
    sha256 = "1v035si8fm7kgmppwpxb83z98rhf1idmzn00h9hnll5rvbxkm8bw";
  };
}
