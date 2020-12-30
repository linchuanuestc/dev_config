# .bashrc
 
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
 
# User specific aliases and functions
ip=`/sbin/ifconfig -a|grep eth0 -A 4 | grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
export LANG=en_US.utf8
export LC_ALL=en_US.utf8
export HISTTIMEFORMAT='%F %T '
#export PS1='[\u@\H \w]\$ '
export PS1='[\u@$ip \w]\$ '
 
# alias
alias grep='grep --color'
alias egrep='egrep --color'
alias gitdiff='git difftool -y --extcmd=vimdiff'

#golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/goworkspace
export PATH=$PATH:$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
export PATH=/home/linchuan/.rpc-tools:$PATH
 
# history
HISTFILESIZE=400000000
HISTSIZE=10000
PROMPT_COMMAND="history -a"
export HISTSIZE PROMPT_COMMAND
shopt -s histappend

#定义path:保证 /usr/local/bin在第一位，因为软件都安装在这里
export PATH=/usr/local/bin:$PATH
