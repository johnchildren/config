self: super:
{
  workEnv = self.buildEnv {
    name = "work-env";
    paths = with self; [
      tmux
      direnv

      gitAndTools.gitFull
      ripgrep
      xsv

      neovim
      emacs
      xclip
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
      go_1_12
      gotools
      dep

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
