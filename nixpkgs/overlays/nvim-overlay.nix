self: super:
let
  inherit (self.vimUtils.override {vim = self.vim;}) buildVimPluginFrom2Nix;
  extra-plugins = {
    prototool-vim = buildVimPluginFrom2Nix {
      pname = "prototool-vim";
      version = "v1.7.0";

      src = self.fetchFromGitHub {
        owner = "uber";
        repo = "prototool";
        rev = "v1.7.0";
        sha256 = "0jvlac0ls6g1w51axx83yaxksqniiaql3lxr31smygsbcz1d54av";
      } + /vim/prototool;
    };
  };
  config = {
    customRC = builtins.readFile ./.vimrc;

    vam.knownPlugins = self.vimPlugins // extra-plugins;
    vam.pluginDictionaries = [
      { names = [
        # Appearance
        "Solarized"
        "vim-airline"
        "vim-airline-themes"

        # General functionality
        "ctrlp"
        "fugitive"
        "tagbar"
        "nerdtree"
        "The_NERD_Commenter"
        "vim-gitgutter"
        "vimproc"
        "polyglot"
        "supertab"
        "nerdtree-git-plugin"

        # "IDE"
        "ale"
        "LanguageClient-neovim"
        "deoplete-nvim"
        "vim-test"

        # Language plugins
        "idris-vim"
        "prototool-vim"
        "dhall-vim"
        "purescript-vim"

        # Latex
        "vimtex"
        ];
      }
    ];
  };
in {
  neovim = super.neovim.override {
      vimAlias = true;
      configure = config;
      withRuby = false;
  };
}
