# Golang
set -gx GOPATH $HOME/Workspace
set -gx PATH $GOPATH/bin $PATH

# Virtual Go
command -v vg >/dev/null 2>&1; and vg eval --shell fish | source

# Direnv
eval (direnv hook fish)
