{ stdenv, rustPlatform, fetchFromGitHub, pkgconfig, openssl, git }:

rustPlatform.buildRustPackage rec {
  name = "git-journal-${version}";
  version = "95a7396f073cb79b475942c1fa516c15e5cda0a7";

  src = fetchFromGitHub {
    owner = "saschagrunert";
    repo = "git-journal";
    rev = version;
    sha256 = "05yl9ir4zxbhg8cnhbdm47xv6p3m7089lh5w77p9kj4kgyhyx695";
  };

  buildInputs = [ pkgconfig openssl git ];

  cargoSha256 = "0i7dsjv85018rpj2zax01z43rmyksv5vwncn7d4wjk14mmk7n7xx";

  meta = with stdenv.lib; {
    description = "The Git Commit Message and Changelog Generation Framework";
    homepage = https://github.com/saschagrunert/git-journal;
    license = licenses.mit;
    maintainers = [ maintainers.johnchildren ];
    platforms = platforms.all;
  };
}
