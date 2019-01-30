self: super:
{
  workEnv = self.buildEnv {
    name = "work-env";
    paths = with self; [
      alacritty
      tmux
      direnv

      gitAndTools.gitFull
      ripgrep
      xsv

      neovim
      xclip
      ctags
      icu

      bazel
      binutils
      gnumake
      
      docker_compose
      minikube

      #pgcli
      wireshark

      # python
      #customPackages.custom-python.interpreter

      # haskell
      #hie.hie82

      # go
      go_1_11
      #go-langserver

      # rust
      rustup
      #latest.rustChannels.stable.rust

      # c/c++
      #customPackages.cquery

      # typescript/javascript
      nodePackages.javascript-typescript-langserver
    ];
  };
}
