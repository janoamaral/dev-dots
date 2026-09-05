#!/bin/zsh
setopt PROMPT_SUBST
autoload -U colors && colors
autoload -U compinit && compinit

# some useful options (man zshoptions)
ZDOTDIR=~/.config/zsh
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Normal files to source
source ~/.config/zsh/functions
source ~/.config/zsh/bindings
source ~/.config/zsh/alias.sh
source ~/.config/zsh/zsh-exports

_fix_cursor() {
   echo -ne '\e[0 q'
}

# Fix cursor after exiting vim
#precmd_functions+=(_fix_cursor)

# FZF
# TODO update for mac
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS='--prompt="  " --pointer="▶" --height=40% --layout=reverse --info=inline --border --margin=0 --padding=0'
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -a1 --icons --color=always $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'

# disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# Plugins
#source ~/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
#source ~/.config/zsh/plugins/docker-zsh-completion/docker-zsh-completion.plugin.zsh
#source ~/.config/zsh/plugins/zsh-autopair/zsh-autopair.plugin.zsh
#source ~/.config/zsh/plugins/zsh-abbr/zsh-abbr.plugin.zsh

autoload bashcompinit && bashcompinit

#zsh_add_file "zsh-vim-mode"

eval "$(zoxide init zsh)"
eval "$(navi widget zsh)"

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line

# Auto startx depending on the tty
# if [[ -z $DISPLAY ]] && (( $EUID != 0 )) {
#     [[ ${TTY/tty} != $TTY ]] && (( ${TTY:8:1} <= 3 )) &&
#         exec startx 1>~/.log/xsession-errors 2>&1 &
# }

TTY="$(tty)"
# Iniciar tmux al abrir una nueva terminal
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ "$TERM" = "xterm-ghostty" ]; then
    tmux has-session -t media 2>/dev/null || tmux new-session -d -s media -c /home/logico/music "cmus"
    tmux has-session -t tools 2>/dev/null || tmux new-session -d -s tools -c /home/logico "lazydocker"
    tmux new -A -s "main"
fi

eval "$(dircolors ~/.dir_colors)"
complete -C '/usr/local/bin/aws_completer' aws
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# pnpm
export PNPM_HOME="/home/logico/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' file-sort change reverse
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /tmp/.zcompcache

source <(kubectl completion zsh)

# opencode
export PATH=/home/logico/.opencode/bin:$PATH

source ~/.config/zsh/ps1.sh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

function sparkle-cli-widget() {
  emulate -L zsh
  setopt local_options pipe_fail no_aliases

  local original_buffer="$BUFFER"
  local result_file
  result_file="$(mktemp "${TMPDIR:-/tmp}/sparkle-cli-result.XXXXXX")" || return 1

  zle -I
  sparkle-cli --context "$BUFFER" --result-file "$result_file"
  local exit_code=$?
  local output=""

  if [[ -s "$result_file" ]]; then
    output="$(<"$result_file")"
  fi
  rm -f "$result_file"

  if [[ $exit_code -eq 0 && -n "$output" ]]; then
    BUFFER="$output"
    CURSOR=${#BUFFER}
  else
    BUFFER="$original_buffer"
    CURSOR=${#BUFFER}
  fi

  zle redisplay
}

zle -N sparkle-cli-widget
bindkey '^A' sparkle-cli-widget
