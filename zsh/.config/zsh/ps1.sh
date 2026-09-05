#!/bin/sh

# Cyberpunk prompt theme

PREFIX=""

SHELLNAME="$(ps -hp $$ | awk '{print $5}')"

__ps1_location ()
{
  X=${PWD/$HOME/\~}
  if [[ $SHELLNAME == "-zsh" ]] || [[ $SHELLNAME == "zsh" ]] || [[ $SHELLNAME == "/usr/local/bin/zsh" ]];
  then
    X=${X##*/}
  fi
  echo "$X"
}


__current_path ()
{
  X=$(__ps1_location)
  if [[ $X == "~" ]];
  then
    exit
  fi
  Y=${PWD/$HOME/\~}
  echo "${Y%\/*}/"
}

__folder_icon ()
{
  X=$(__ps1_location)
  #icon=" "
  icon=" "
  if [ "$X" = "~" ];
  then
    icon="󱂶 "
  fi

  if [ "$X" = "ramdisk" ];
  then
    icon="󰍛 "
  fi

  if [ "$X" = "dots" ];
  then
    icon="󱁿 "
  fi

  if [ "$X" = "music" ];
  then
    icon="󱍚 "
  fi

  echo "$icon"
}

__venv_icon ()
{
  if [ -n "$VIRTUAL_ENV" ];
  then
    echo "  "
  fi
}

preexec () {
   (( $#_elapsed > 1000 )) && set -A _elapsed $_elapsed[-1000,-1]
   typeset -ig _start=SECONDS
}

# Ensure the cursor starts as a beam
_fix_cursor() { echo -ne '\e[5 q' }
precmd_functions+=(_fix_cursor)

RUN_ICON="%{%F{black}%}󰧑 󰹴 󰟀  "
FAIL_ICON="   ◢◤◢◤◢◤◢◤   CONNECTION LOST ◢◤◢◤◢◤◢◤ "
MAIN_COLOR="#9ddadc"
BACK_COLOR="#25292d"
RUN_COLOR="$MAIN_COLOR"
FAIL_COLOR="#DF4947"
ACCENT_COLOR="#6d6f71"
#MAIN_COLOR="#02CDD1"
TERM_ICON="%{%F{white}%} "
AI_ICON="󰌶 "
CONNECTOR_UP="╭"
CONNECTOR_DOWN="╰"
_lineup=$'\e[1A'
_linedown=$'\e[1B'

KERNEL_VERSION="$(uname -r | cut -d'-' -f1)"

UPEO_ICON="%{$reset_color%}%{%K{black}%}%{%F{#232D2E}%}◢◤◢◤◢◤◢◤"
WARNING_BAR="%{$reset_color%}%{%K{default}%}%{%F{#b3ff28}%}◢◤◢◤◢◤"
VHS_BAR_Y="%{$reset_color%}%{%K{#f8d544}%}%{%F{#f8d544}%}◢%{%K{#ec3a26}%}%{%F{#f8d544}%}◤"
VHS_BAR_R="%{$reset_color%}%{%K{#ec3a26}%}%{%F{#ec3a26}%}◢%{%K{#e81255}%}%{%F{#ec3a26}%}◤"
VHS_BAR_M="%{$reset_color%}%{%K{#e81255}%}%{%F{#e81255}%}◢%{%K{#321d84}%}%{%F{#e81255}%}◤"
VHS_BAR_B="%{$reset_color%}%{%K{#321d84}%}%{%F{#321d84}%}◢%{%K{black}%}%{%F{#321d84}%}◤"

INDICATOR_ICON="%{$reset_color%}%{%F{#000000}%}%{%K{#0ae565}%} READY %{$reset_color%}"

VHS_BAR="$VHS_BAR_Y$VHS_BAR_R$VHS_BAR_M$VHS_BAR_B"

OS_ICON="%{$reset_color%}%{%F{#000000}%}%{%K{#b3ff28}%} |󰐲 𝗥𝗘𝚲𝗗𝗬 ${RUN_ICON}%{%K{#b3ff28}%}%{%F{#000000}%}   %{%F{#000000}%}%n%{%F{#000000}%} ■■■■ /󱊧  ◢${WARNING_BAR}%{$reset_color%}"

MODE_ICON="${OS_ICON}"


if [[ $SHELLNAME == "-zsh" ]] || [[ $SHELLNAME == "zsh" ]] || [[ $SHELLNAME == "/usr/local/bin/zsh" ]] || [[ $SHELLNAME == "/usr/bin/zsh" ]] || [[ $SHELLNAME == "/usr/sbin/zsh" ]];
then
  setopt PROMPT_SUBST
  autoload -U colors && colors
  PROMPT='%{%F{$BACK_COLOR}%}%{%K{$BACK_COLOR}%}%{%F{black}%}%{%F{$MAIN_COLOR}%}$(__folder_icon) %{%F{#75878a}%}$(__current_path)%{%F{$MAIN_COLOR}%}$(tput bold)$(__ps1_location) %{%F{$ACCENT_COLOR}%}󰘳-𝐚%{$reset_color%}%{%F{$BACK_COLOR}%}%{$reset_color%}
'
else
  PS1='${FG_B_RED}${PREFIX}${BOLD} ${RESET}$(__ps1_location) '
fi

