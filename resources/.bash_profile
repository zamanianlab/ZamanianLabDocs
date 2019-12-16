echo "Sync Profile Loaded"

alias refresh="source ~/.bash_profile"
#alias git log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Paths
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH
export GIT_PATH="$HOME/GitHub"
export GIT_DATA="$HOME/Box/GHdata"

# Command Preferences and Shortcuts
alias h=history
alias ls="ls -pG" #show directories
alias l="ls -lhGgo" #show directories
alias tarup="tar -zcf"
alias tardown="tar -zxf"

alias box="cd ~/Box/"
alias brc6="ssh zamanian@brc6.secure.biotech.wisc.edu"

# autojump configuration
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Suggested by Mendel Cooper in "Advanced Bash Scripting Guide"
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)      tar xvjf $1 ;;
      *.tar.gz)       tar xvzf $1 ;;
      *.tar.xz)       tar Jxvf $1 ;;
      *.bz2)          bunzip2 $1 ;;
      *.rar)          unrar x $1 ;;
      *.gz)           gunzip $1 ;;
      *.tar)          tar xvf $1 ;;
      *.tbz2)         tar xvjf $1 ;;
      *.tgz)          tar xvzf $1 ;;
      *.zip)          unzip $1 ;;
      *.Z)            uncompress $1 ;;
      *.7z)           7z x $1 ;;
      *)              echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# Get working directory of frontmost finder window.
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# Symbolic links
if [ -e "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ]
then
  ln -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
fi
