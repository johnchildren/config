{ stdenv, runCommand, electron, callPackage,
  bash, python, nodejs-8_x, node ? nodejs-8_x, neovim, ripgrep, makeWrapper,
 ...}: 
let 
  yarn2nix = callPackage ( builtins.fetchTarball { 
    url = "https://github.com/phryneas/yarn2nix/archive/8a6b9dcf7cef8840eb7bc64d7639bad566af2e9d.tar.gz " ;
    sha256 = "0ih11vcd9ad5y13877bxz7ijsykhqwdfwmvwhic3xlgcdhxji80v";
  }) {};
in
(yarn2nix.mkYarnPackage rec {
  name = "oni";
  version = "v0.3.6";
  src = builtins.fetchTarball { 
    url = "https://github.com/onivim/oni/archive/${version}.tar.gz" ;
    sha256 = "10rfm5kxwim6010jhg8v0jz5s2mndb34vgx8bd083a9givlib9v4";
  };
  yarnLock = runCommand "yarn.lock" {} ''
      cp ${src}/yarn.lock .
      chmod +w yarn.lock
      ${yarn2nix.yarn2nix}/bin/yarn2nix --no-nix --lockfile yarn.lock
      cp yarn.lock $out
  '';

  /*
  some dependencies have preinstall, install or postinstall scripts that need to be taken into account.
  those were identified by:

  find node_modules -name package.json -exec bash -c 'test -n "$( jq ".scripts|{preinstall,install,postinstall}|select(.preinstall or .install or .postinstall)" {})" && echo {}' \;

  result:
  node_modules/electron/package.json
  node_modules/oni-neovim-binaries/package.json
  node_modules/bs-platform/package.json
  node_modules/oni-ripgrep/package.json
  node_modules/styled-components/package.json
  node_modules/opencollective/test/package_with_postinstall/package.json
  node_modules/husky/package.json
  node_modules/electron-chromedriver/package.json

  on first glance, none of these seem to be really required though
  */
  postConfigure = ''
  '';
  
  nativeBuildInputs = [ makeWrapper ];
  
  buildPhase = ''
    cd deps/${name}

    sed -i 's/npm install &&//' vim/core/oni-plugin-typescript/package.json
    sed -i '/"declaration":/s/true/false/' vim/core/oni-plugin-typescript/tsconfig.json

    sed -i 's/"build:plugins": .*$/"build:plugins": "true",/' package.json

    yarn build

    cd ../..
  '';

  postInstall = ''
      wrapProgram $out/bin/oni --prefix PATH ":" \
        "${stdenv.lib.makeBinPath [ electron python node neovim ripgrep ]}"
  '';
})
