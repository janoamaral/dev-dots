setopt PROMPT_SUBST

PROMPT_MODE='>'

function zle-keymap-select {
    case "$KEYMAP" in
        vicmd)
            PROMPT_MODE='⏺'
            ;;
        *)
            PROMPT_MODE='>'
            ;;
    esac

    zle reset-prompt
}

function zle-line-init {
    PROMPT_MODE='>'
    zle reset-prompt
}

zle -N zle-keymap-select
zle -N zle-line-init

PS1='%F{cyan}𝝂%f %F{blue}%m%f %F{green}%~%f${GIT_PROMPT}
%F{cyan}${PROMPT_MODE}%f '
