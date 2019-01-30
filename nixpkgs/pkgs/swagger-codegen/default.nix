{ stdenv, fetchurl, jre, makeWrapper }:

stdenv.mkDerivation rec {
  version = "3.0.0";
  pname = "swagger-codegen";
  name = "${pname}-${version}";

  jarfilename = "${pname}-cli-${version}.jar";

  nativeBuildInputs = [
    makeWrapper
  ];

  src = fetchurl {
    url = "https://oss.sonatype.org/content/repositories/releases/io/swagger/codegen/v3/${pname}-cli/${version}/${jarfilename}";
    sha256 = "1isclz080rp4cvvc5c9rw8dfkqgpng0yzcg7xgvbm9n7g5s366db";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    install -D "$src" "$out/share/java/${jarfilename}"
    makeWrapper ${jre}/bin/java $out/bin/swagger-codegen \
      --add-flags "-jar $out/share/java/${jarfilename}"
  '';

  meta = with stdenv.lib; {
    description = "Allows generation of API client libraries (SDK generation), server stubs and documentation automatically given an OpenAPI Spec";
    homepage = https://github.com/swagger-api/swagger-codegen;
    license = licenses.asl20;
    maintainers = [ maintainers.jraygauthier ];
  };
}
