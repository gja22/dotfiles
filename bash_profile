# .bash_profile is executed when the shell starts
bash --version
echo "executing .bash_profile"

# Customise the shell prompt
PS1="\W$ "

# Set aliases
alias ls='ls -aG'                      #colorized output and hidden files
alias ll='ls -alG'                     #long listing, colorized output and hidden files
alias mkdir='mkdir -pv'	               #-p create intermediate dirs
alias c='clear'
alias p='pwd'
alias cp='cp -iv'                      #-i prompt to overwrite
alias mv='mv -iv'                      #-i prompt to overwrite
alias path='echo $PATH | tr ":" "\n"'  #show path on separate lines.
alias reload='source ~/.bash_profile'  #reload bach profile in current session

cd() { builtin cd "$@"; pwd; }

alias gs='git status'
alias ga='git add'

# Set up Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/protobuf/bin
