export GOPATH=$HOME/src/go-workspace

export PATH=$PATH:$HOME/local/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/local/games:$HOME/local/opt/racket/bin:$HOME/local/opt/dotnet/5.0
export PATH="$PATH:$HOME/local/opt/sqlpackage"

export EDITOR=vim
export PAGER=less
#export SHELL=`which zsh`

alias k=kubectl
alias docker=podman

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

[ -d "/Applications/draw.io.app/Contents/MacOS/" ] && export PATH=$PATH:/Applications/draw.io.app/Contents/MacOS/

export JOLIE_HOME="/home/michael/local/lib/jolie"

function jj {
    jobs -d | less
}

function tw-date {
    DATE_EXEC="date"

    if [[ "$(uname)" == "Darwin" ]]; then
        DATE_EXEC="gdate"
    fi

    ${DATE_EXEC} -u +%Y%0m%0d%0H%0M%0S000
}

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

function vmd () {
  pandoc $1 | lynx -stdin
}
