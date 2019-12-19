{ pkgs ? import <nixpkgs> {} }:
rec {
  clojure_lsp = pkgs.callPackage ./clojure-lsp {};

  cquery = pkgs.callPackage ./cquery {};

  libpg_query = pkgs.callPackage ./libpg_query {};

  sqlint = let
    lib = pkgs.lib;
    bundlerApp = pkgs.bundlerApp;
  in import ./sqlint { inherit lib bundlerApp libpg_query; };

  go-langserver = pkgs.callPackage ./go-langserver {};

  oni-vim = pkgs.callPackage ./oni {};

  swagger-codegen = pkgs.callPackage ./swagger-codegen {};

  openapi-generator = pkgs.callPackage ./openapi-generator {};

  prototool = pkgs.callPackage ./prototool {};

  golangci-lint = pkgs.callPackage ./golangci-lint {};

  git-journal = pkgs.callPackage ./git-journal {};

  metals = pkgs.callPackage ./metals {};

  legere = pkgs.callPackage ./legere {};

  elba = pkgs.callPackage ./elba {};

  idris-latest = pkgs.callPackage ./idris-latest {};

  idris2 = pkgs.callPackage ./idris2 { inherit idris-latest; };

  scdlang = pkgs.callPackage ./scdlang {};
}
