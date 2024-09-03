# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

#aliases
alias g='git'
alias gaa='git add -A'
alias gb='git branch'
alias gcmm='git commit -m'
alias gco='git checkout'
alias gmg='git merge'
alias gp='git push -u origin'
alias gst='git status'
alias glast='git log -1 HEAD'
alias la='ls -A'
alias gpll='git pull'
alias ghist='git log --graph --pretty=format:"%C(yellow)%h%Creset %Cgreen(%ar)%Creset %C(blue)%s%Creset %C(magenta)%d%Creset [%an]" --abbrev-commit --date=relative'
alias ghist2="g log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias gsw='git switch'
alias flask='python3 -m flask'
alias kubectl='minikube kubectl --'
alias v=openNvim
alias env_dbt='source $HOME/dbt-env/bin/activate'

# OpenAI API Key
export OPENAI_API_KEY=""


function openNvim {
  if [ $# -eq 0 ]; then
    nvim
  else
    nvim $1
  fi
}

function copy {
  if command -v xclip >/dev/null 2>&1; then
    output=$( { "$@" 2>&1; } )
    echo "$output" | xclip -selection clipboard
    echo "$output"
  else
    echo "Error: xclip no está instalado. Por favor, instálalo e inténtalo de nuevo." >&2
    return 1
  fi
}

# Console Ninja Path
export PATH=~/.console-ninja/.bin:$PATH

# fnm
FNM_PATH="/home/brito/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/brito/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

BREW_BIN="/home/linuxbrew/.linuxbrew/bin"
eval "$($BREW_BIN/brew shellenv)"

export PROJECT_PATHS="/home/alanbuscaglia/work"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exlude .git"
export PATH=$PATH:/usr/local/go/bin

WM_VAR="/$ZELLIJ"
WM_CMD="zellij"

if [[ $- == *i* ]] && [[ -z "${WM_VAR#/}" ]]; then
	exec $WM_CMD
fi

# Run ssh-agent
eval $(ssh-agent -s)

# Export path for go
export PATH=$PATH:/usr/local/go/bin
