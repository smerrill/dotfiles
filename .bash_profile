#
# BASH configuration file
#

# Find homebrew prefix if it is available.
brew_prefix=$(brew --prefix)

# Enable bash_completion from brew.
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi

# Put homebrew PHP ahead in $PATH a la http://justinhileman.info/article/reinstalling-php-53-on-mac-os-x/
export PATH=$HOME/bin:$brew_prefix/sbin:$brew_prefix/bin:$PATH

# Terminal coloring
export CLICOLOR=1

# Use vim as editor for commits, etc.
export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim=$EDITOR

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# EC2 Tools.
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"

[[ -d "$HOME/.ec2" ]] && {
  export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
  export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
  export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
  export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-62308/jars"
}

# If we are in an interactive session, source bashrc.
[[ -n $PS1 && -f ~/.bashrc ]] && . ~/.bashrc

