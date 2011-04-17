#
# .bashrc - interactive shell configuration
#

# check for interactive
[[ $- = *i* ]] || return

# TODO: Add git prompt.

# Handle resizes gracefully.
shopt -s checkwinsize

hg_ps1() {
    hg prompt "{ on {branch}}{ at {bookmark}}{status}" 2> /dev/null
}

# a functional but sane prompt
bash_prompt() {
  local NONE="\[\e[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\e[0;30m\]" R="\[\e[0;31m\]" G="\[\e[0;32m\]" Y="\[\e[0;33m\]" \
        B="\[\e[0;34m\]" M="\[\e[0;35m\]" C="\[\e[0;36m\]" W="\[\e[0;37m\]"

  # emphasized (bolded) colors
  local EMK="\[\e[1;30m\]" EMR="\[\e[1;31m\]" EMG="\[\e[1;32m\]" EMY="\[\e[1;33m\]" \
        EMB="\[\e[1;34m\]" EMM="\[\e[1;35m\]" EMC="\[\e[1;36m\]" EMW="\[\e[1;37m\]"

  # username/host color for root/other
  (( UID != 0 )) && local UC=$W || local UC=$R

  RET_VALUE='$((( RET )) && printf ":\[\e[1;31m\]$RET\[\e[0m\]")'
  HG_INFO='$(hg_ps1)'
  GIT_INFO='$(__git_ps1 " on %s")'

  # space goes inside the printf so its not there when there's no git branch
  PS1=" ${EMK}┌┤${UC}\u${EMK}@${UC}\h${RET_VALUE} ${EMG}[\D{%Y-%m-%d %H:%M:%S}] ${EMB}\w${EMM}${HG_INFO}${GIT_INFO}${EMW}\n ${EMK}└╼${NONE} "
  PS4='+$BASH_SOURCE:$LINENO:$FUNCNAME: '
}

# show return val of last command
PROMPT_COMMAND='RET=$?'
bash_prompt
unset bash_prompt

