{ lib, bundlerApp, libpg_query }:

bundlerApp rec {
  pname = "sqlint";
  gemdir = ./.;
  exes = [ "sqlint" ];

  meta = with lib; {
    description = "Simple SQL Linter";
    homepage = https://github.com/purcell/sqlint;
    license = licenses.mit;
    maintainers = [ maintainers.purcell ];
    platforms = platforms.unix;
  };
}
