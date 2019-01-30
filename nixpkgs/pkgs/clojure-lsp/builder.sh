source $stdenv/setup

lein uberjar

clojure_lsp_bin=$out/bin/clojure-lsp

mkdir -pv $(dirname $clojure_lsp_bin)
cp -v $src $clojure_lsp_bin
chmod -v 755 $clojure_lsp_bin

patchShebangs $clojure_lsp_bin

sed -i \
    -e "s;\${CLOJURE_LSP_JAVA_COMMAND:-java};\${CLOJURE_LSP_JAVA_COMMAND:-${jdk}/bin/java};g" \
    $clojure_lsp_bin
