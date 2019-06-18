{ stdenv, buildEnv, lib, fetchMavenArtifact, jre, makeWrapper, scala }:

let
  jreWithScala = buildEnv {
    name = "jre-with-scala";
    paths = [
      jre
      scala
    ];
  };
in stdenv.mkDerivation rec {
  name = "metals_2.12-${version}";
  version = "0.5.0";

  src = fetchMavenArtifact {
    inherit version;
    artifactId = "metals_2.12";
    groupId = "org.scalameta";
    sha512 = "1vj2gdcbgjczhrl6dcsa9yaypri0h2f51xlrdd7xpxc0pm420rp6w86vscz9xar6s034c6a09srqc2p8ziq3lg2fmr2cvgbv40m0gir";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p "$out"/{lib,bin}
    cp -r $src/share/java/metals_2.12-${version}.jar $out/lib/metals_2.12-${version}.jar

    echo "#! ${stdenv.shell}" >> "$out/bin/metals"
    echo "java -Dmetals.client=vim-lsc -cp '$out/lib/metals_2.12-${version}.jar:${scala}/lib/scala-library.jar:$CLASSPATH' scala.meta.metals.Main \"\$@\"" >> "$out/bin/metals"

    chmod a+x $out/bin/metals

    wrapProgram "$out/bin/metals" --set JAVA_HOME "${jreWithScala}" --prefix PATH : ${lib.makeBinPath [ jreWithScala ]}
  '';
}
