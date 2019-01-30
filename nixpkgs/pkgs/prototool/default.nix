{ stdenv, buildBazelPackage, fetchFromGitHub, go, git, cacert }:

buildBazelPackage rec {
  name = "prototool-${version}";
  version = "2019-01-25";

  bazelTarget = "//cmd/prototool";

  src = fetchFromGitHub {
    owner = "uber";
    repo = "prototool";
    rev = "a9066bc7e2671187eba7e7501009d6e87ffffb67";
    sha256 = "0g7c1lb1jrnc34p4siphbgqzj4jpmfqyjbv2alhcdczpmdhpxxn6";
  };

  nativeBuildInputs = [ go git ];

  fetchAttrs = {
      preBuild = ''
        patchShebangs .
        # tell rules_go to use the Go binary found in the PATH
        sed -e 's:go_register_toolchains():go_register_toolchains(go_version = "host"):g' -i WORKSPACE

        # tell rules_go to invoke GIT with custom CAINFO path
        export GIT_SSL_CAINFO="${cacert}/etc/ssl/certs/ca-bundle.crt"
      '';

      preInstall = ''
        # Remove the go_sdk (it's just a copy of the go derivation) and all
        # references to it from the marker files. Bazel does not need to download
        # this sdk because we have patched the WORKSPACE file to point to the one
        # currently present in PATH. Without removing the go_sdk from the marker
        # file, the hash of it will change anytime the Go derivation changes and
        # that would lead to impurities in the marker files which would result in
        # a different sha256 for the fetch phase.
        rm -rf $bazelOut/external/{go_sdk,\@go_sdk.marker}
        sed -e '/^FILE:@go_sdk.*/d' -i $bazelOut/external/\@*.marker

        # Remove the gazelle tools, they contain go binaries that are built
        # non-deterministically. As long as the gazelle version matches the tools
        # should be equivalent.
        rm -rf $bazelOut/external/{bazel_gazelle_go_repository_tools,\@bazel_gazelle_go_repository_tools.marker}
        sed -e '/^FILE:@bazel_gazelle_go_repository_tools.*/d' -i $bazelOut/external/\@*.marker
      '';

      sha256 = "14k1cpw4h78c2gk294xzq9a9nv09yabdrahb8gin8xizbgdxn1q8";
  };

  buildAttrs = {
    preBuild = ''
      patchShebangs .
      # tell rules_go to use the Go binary found in the PATH
      sed -e 's:go_register_toolchains():go_register_toolchains(go_version = "host"):g' -i WORKSPACE
    '';

    installPhase = ''
      install -Dm755 bazel-bin/prototool/*_pure_stripped/ibazel $out/bin/prototool
    '';
  };


  meta = with stdenv.lib; {
    homepage = "https://github.com/uber/prototool";
    description = "Your Swiss Army Knife for Protocol Buffers";
    license = licenses.mit;
    maintainers = [ maintainers.johnchildren ];
    platforms = platforms.all;
  };
}
