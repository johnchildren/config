{ stdenv, fetchurl, jre, makeWrapper }:

stdenv.mkDerivation rec {
  version = "3.3.2";
  pname = "openapi-generator";
  name = "${pname}-${version}";

  jarfilename = "${pname}-cli-${version}.jar";

  nativeBuildInputs = [
    makeWrapper
  ];

  src = fetchurl {
    url = "http://central.maven.org/maven2/org/openapitools/${pname}-cli/${version}/${jarfilename}";
    sha256 = "1mprd5gkwxlms71iy2b3vd706xxflzcf8i6nxsyravcngv5gk5sh";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    install -D "$src" "$out/share/java/${jarfilename}"
    makeWrapper ${jre}/bin/java $out/bin/openapi-generator \
      --add-flags "-jar $out/share/java/${jarfilename}"
  '';

  meta = with stdenv.lib; {
    description = "Allows generation of API client libraries (SDK generation), server stubs and documentation automatically given an OpenAPI Spec";
    homepage = https://github.com/OpenAPITools/openapi-generator;
    license = licenses.asl20;
    maintainers = [ maintainers.jraygauthier ];
  };
}
