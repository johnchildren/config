# Git
#
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# Golang
set -gx GOPATH $HOME/Workspace
set -gx PATH $GOPATH/bin $PATH

# Direnv
eval (direnv hook fish)

# Cargo binaries
set -gx PATH $HOME/.cargo/bin $PATH

# stack binaries
set -gx PATH $HOME/.local/bin $PATH

# cabal binaries
set -gx PATH $HOME/.cabal/bin $PATH
