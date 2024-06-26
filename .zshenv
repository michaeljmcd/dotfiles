export GOPATH=$HOME/src/go-workspace

export PATH=$PATH:$HOME/local/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/local/games:$HOME/local/opt/racket/bin:$HOME/local/opt/dotnet/5.0
# Enable this only if you don't have WSL2 + Docker Desktop bridge goodness
#export DOCKER_HOST=tcp://0.0.0.0:2375

export EDITOR=vim
export PAGER=less
export SHELL=`which zsh`

#alias ls="ls --color=auto"
#alias docker="winpty docker"
#alias docker-compose="winpty docker-compose"
alias k=kubectl

#export DISPLAY=:0

# This detects WSL2 and sets the display as it goes undetected otherwise.
if [[ $(uname -a) == *"microsoft-standard"* ]]; then
    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    export LIBGL_ALWAYS_INDIRECT=1
fi


function preview_xml {
    xmllint --format "$1" | pygmentize -l xml | less -R
}

function format_xml {
    cp =(xmllint --format "$1") "$1"
}

function view_code {
    pygmentize -O encoding=utf-8 "$1" | less -R
}

function xpath_grep {
    xmlstarlet sel -t -c $1 -n $*[2,${#*}]
}

function xpath_find {
    xmlstarlet sel -t -m $1 -n -f $*[2,${#*}]
}


function update_tags {
    if [ -e tags ]
    then
        rm tags
    fi

    ctags -R .
}

function page-file {
    filename=${1}

    find . -name "${1}" | xargs less
}

function jepoch {
    input_date=${1}

    in_seconds=`date --date=${input_date} +%s`

    bc -q <<EOF
    ${in_seconds}*1000
EOF
}

function plantuml {
    java -jar $HOME/local/opt/plant*.jar $*
}

function vmd () {
  pandoc $1 | lynx -stdin
}

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

#if [ -e /Users/jisamm9/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jisamm9/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
#if [ -e /home/michael/.nix-profile/etc/profile.d/nix.sh ]; then . /home/michael/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export JOLIE_HOME="/home/michael/local/lib/jolie"
