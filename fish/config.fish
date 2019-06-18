# Golang
set -gx GOPATH $HOME/Workspace
set -gx PATH $GOPATH/bin $PATH

# Virtual Go
command -v vg >/dev/null 2>&1; and vg eval --shell fish | source

# Direnv
eval (direnv hook fish)

# Cargo binaries
set -gx PATH $HOME/.cargo/bin $PATH

# stack binaries
set -gx PATH $HOME/.local/bin $PATH

# cabal binaries
set -gx PATH $HOME/.cabal/bin $PATH
