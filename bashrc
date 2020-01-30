#!/bin/bash

umask 002 # 002 = rwxrwxr.x 022 = rwxr.xr.x
export EDITOR=vim

alias md5fingerprint='ssh-keygen -E md5 -lf'
alias sshmd5=md5fingerprint
function sep() { true ; printf '_%.0s' {1..120} ; echo ; for i in {1..10}; do printf '|_%.0s' {1..60} ; echo '|' ; done ; $* ; }

alias lsbase='ls --color'
alias ll='lsbase -lhFp'
alias lla='ll -A'
alias llaa='ll -A .*'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

### gnu sed: sed ':a;N;$!ba;s/\n/ /g'
function toline() { local sep=" " ; if [ ! -z "$1" ]; then sep="$1" ; fi ; sed -e :a -e "\$!N; s/\n/$sep/; ta" ; }
alias tolinecomma='sed -e :a -e "\$!N; s/\n/, /; ta"'
function tosplit() { local f=" " ; local r="\n" ; if [ ! -z "$1" ]; then f="$1" ; fi ; if [ ! -z "$2" ]; then r="$2" ; fi ; awk "{gsub(/$f/,\"$r\")}1" ; }
alias replace=tosplit

# templates just for informative purposes
alias multilineinput="echo -e \"{ cat > outputfile <<-EOT\n\nEOT\n}\""
alias multilineecho="echo -e \"{ cat <<-EOT\n\nEOT\n}\""
alias multilinevariable2="echo -e \"read -d '' variable <<-EOT\n\nEOT\n\necho \\\"\\\$variable\\\"\""
alias multilinevariable="echo -e \"variable=\\\$(cat <<-EOT\n\nEOT\n)\n\necho \\\"\\\$variable\\\"\""

[ -f ~/env/bash.git ] && source ~/env/bash.git
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

[ -f ~/env/bash_git ] && source ~/env/bash_git
[ -f ~/env/bash_bosh ] && source ~/env/bash_bosh

cd /var/vcap/store/workarea

 if direnv version > /dev/null 2>&1 ; then eval "$(direnv hook bash)" ; fi
