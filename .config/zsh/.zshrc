# Enable colors and change prompt:
autoload -U colors && colors # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory.
HISTSIZE=50000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

setopt autocd # Automatically cd into typed directory.
setopt interactive_comments
stty stop undef # Disable ctrl-s to freeze terminal.

# Load asdf config;
source $HOME/.asdf/asdf.sh

# Load aliases and shortcuts
source ~/.config/shell/aliasrc

# Load fzf keybinds; Installed via pacman
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# append asdf completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line

# Bind session
bindkey -s '^a' 'bc -lq\n'
bindkey -s '^f' 'cd "$(fd --hidden --exclude .git --type d | fzf)"\n'
bindkey '^[[P' delete-char
bindkey '^e' edit-command-line

# Load vi mode config
source ~/.config/zsh/vimode
