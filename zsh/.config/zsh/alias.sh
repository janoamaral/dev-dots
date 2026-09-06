### Set alias
#############

# Navigation
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'

alias g='cd '
alias zz='z -'

# System
alias ls='ls --color=auto '
alias ll='exa -aGx --icons --long --no-permissions --no-user --no-time --color-scale'
alias free='free -h'
alias google-chrome='google-chrome --enable-blink-features=MiddleClickAutoscroll'
alias cat=batcat

# Varios
alias calc=bc -i
alias w="$HOME/dots/scripts/w.sh"
alias tmux=tmux -u -2
alias attach="tmux attach-session -t"
alias youtube-audio="youtube-dl --add-metadata --write-all-thumbnails --embed-thumbnail --write-info -i --extract-audio --audio-format mp3 --audio-quality 0 "
alias update-plugins="$HOME/dots/scripts/update_plugins.sh"
alias upgrade_fzf="cd ~/.fzf && git pull && ./install"

# Git
# Pull
alias gpl="git pull"
alias gpp="git push"
alias gpr="gh pr create --web"
alias gcn="git checkout -b"
#alias gco="git checkout"
alias gac="git add . && git commit"
# cd al root
#alias gcr="cd $(git rev-parse --show-toplevel || echo ".")"
# Pull request tiene que pasar a función
#alias ghr="gh pr create --base master --body \"`git show-branch --no-name HEAD`\" --assignee @me --title "


# Package manager
alias update="sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y;~/dots/scripts/update_repos.sh ~/dev/jsr;rustup update;npm update -g"
#alias install="sudo nala install"
alias install="yay -S --noconfirm"
alias uninstall="yay -R --noconfirm"

# Edición rápida de archivos de configuración
alias v=nvim
#alias vi=nvim
alias vim=nvim
alias vf=vifm
alias vimdiff='nvim -d'
#alias vr="nvim ~/dots/scripts/remap60.sh"
#alias vb="nvim $HOME/dots/bspwm/bspwmrc"
#alias vs="nvim $HOME/dots/sxhkd/sxhkdrc"
alias vt="nvim $HOME/dots/tmux/.tmux.conf"
alias vv="nvim $HOME/dots/nvim/init.lua"
alias vz="nvim $HOME/dots/zsh/zshrc"
alias vg="nvim $HOME/dots/ghostty/config"
alias vh="nvim $HOME/dots/hypr/hyprland.conf"

export LS_COLORS='rs=0:di=01;30:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32'

alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias docker-log='docker compose logs -f -t'

#alias pbcopy='xsel --input --clipboard'
#alias pbpaste='xsel --output --clipboard'
alias pbcopy='wl-copy'
alias pbpaste='wl-paste'
alias http='xh'

#alias open='xdg-open'
