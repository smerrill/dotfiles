#
# BASH configuration file
#

case $(uname) in
Darwin)
  # Find homebrew prefix if it is available.
  brew_prefix=$(brew --prefix)

  # Enable bash_completion from brew.
  if [ -f $brew_prefix/etc/bash_completion ]; then
    . $brew_prefix/etc/bash_completion
  fi

  # Put homebrew PHP ahead in $PATH a la http://justinhileman.info/article/reinstalling-php-53-on-mac-os-x/
  export PATH=$brew_prefix/sbin:$brew_prefix/bin:$PATH

  # Terminal coloring
  export CLICOLOR=1

  # Use vim as editor for commits, etc.
  export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
  alias vim=$EDITOR
  alias gvim=mvim

  # EC2 Tools.
  export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"

  [[ -d "$HOME/.ec2" ]] && {
    export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
    export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
    export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
    export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-62308/jars"
  }
  ;;
Linux)
  # Muscle memory is a powerful thing.
  type -P gvim > /dev/null && {
    alias mvim=gvim
  } || {
    alias mvim=vim
  }

  # Set a proper $EDITOR.
  export EDITOR="vim"
  ;;
esac

# Do you like a colorful grep? I do!
alias grep="grep --color=auto"

# Always set up $HOME/bin in the front of $PATH.
export PATH=$HOME/bin:$PATH

# Load other files for bash's use, including some that may not be in git.
[[ -d ~/.profile.d ]] && for i in ~/.profile.d/*; do
  source $i
done

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# If we are in an interactive session, source bashrc.
[[ -n $PS1 && -f ~/.bashrc ]] && . ~/.bashrc

