shopt -s histappend
shopt -s checkwinsize

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

function pandoq() {
  PDFPATH=$(dirname $1)/$(basename $1 .md).pdf
  pandoc --defaults=$HOME/.pandoc.yaml $1 -o $PDFPATH
}

alias exa="exa --long --icons --git"
alias websrv="sshpass -p 'p3-web046' ssh p3-web046@133.15.41.21 -p 10046"
alias atksrv="sshpass -p 'p3-atk046' ssh p3-atk046@133.15.41.21 -p 30046"
alias websrv-scp="sshpass -p 'p3-web046' scp -r -P 10046 p3-web046@133.15.41.21:~ ~"

! shopt -oq posix && [ -f /usr/share/bash-completion/bash_completion ] && \
  . /usr/share/bash-completion/bash_completion

type lesspipe &> /dev/null && eval "$(lesspipe)"
type starship &> /dev/null && eval "$(starship init bash)"
