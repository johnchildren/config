self: super:
let
config = {
  customRC = builtins.readFile ./.vimrc;

  vam.knownPlugins = self.vimPlugins;
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
