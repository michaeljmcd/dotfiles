# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="bureau"
#ZSH_THEME="af-magic"
#ZSH_THEME="risto"
#ZSH_THEME="spaceship"
#ZSH_THEME="nox"
#ZSH_THEME="lambda" # A simple theme with a lambda prompt
#ZSH_THEME="simple"
#ZSH_THEME="mh"
#ZSH_THEME="kolo" # Simple prompt with a % prompt. Only shows current directory name, not full path.
ZSH_THEME="gentoo"
#SPACESHIP_BATTERY_SHOW=false

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(kubectl fossil)

# Removing git because its aliases mess with Gambit.

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unsetopt autopushd
#setopt no_share_history

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export ZSH_DISABLE_COMPFIX=true
#[ -f "/home/michael/.ghcup/env" ] && source "/home/michael/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -f '/Users/jisamm9/.config/broot/launcher/bash/br' ]] && source /Users/jisamm9/.config/broot/launcher/bash/br
export PATH="/usr/local/opt/krb5/bin:$PATH"

#export PATH=$PATH:~/.vim/pack/michael/start/vim-iced/bin
#eval "$(docker-machine env default)"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
#
#command -v starship && eval "$(starship init zsh)"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

if [ -e "/Users/jisamm9/local/opt/ImageMagick-7.0.10" ]; then
  export MAGICK_HOME="/Users/jisamm9/local/opt/ImageMagick-7.0.10"
  export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"
  export PATH="$PATH:$MAGICK_HOME/bin"
fi

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jisamm9/local/dist/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jisamm9/local/dist/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jisamm9/local/dist/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jisamm9/local/dist/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
alias om='podman run -it --rm -v "$HOME:$HOME" -e "HOME=$HOME" -w "$PWD" -e "DISPLAY=`ifconfig | grep -o "inet [0-9.]*" | grep -Eo "[0-9.]{7,}" | grep -Fv 127.0.0.1 | head -1`:0" --user $UID openmodelica/openmodelica:v1.24.3-gui'

# Use GNU documentation viewers because built-in macOS ones are slow.
[ -f "$(which gman)" ] && alias man=gman
[ -f "$(which gapropos)" ] && alias apropos=gapropos

