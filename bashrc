# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
#PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
PS1="\[\e[32;1m\]\u @ haha \[\e[36;1m\]\W \[\e[36;1m\]\$ \[\e[0m\]"
#	PS1="\[\e[32;1m\]\u \[\e[36;1m\]\W \[\e[36;1m\]\$ \[\e[0m\]"
    ;;
*)
	PS1="\[\e[32;1m\]\u @ \H \[\e[36;1m\]\W \[\e[33;1m\]\$ \[\e[0m\]"
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias c='cd'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export EDITOR=vim
export MKDEP=makedepend
export PATH=/usr/local/comp/mips-elf/gcc-2.95.3/bin/:$PATH
export PATH=/home/liuqi/toolchain/gcc-cross-4.4/install/bin/:$PATH
#export PATH=/usr/local/comp/mips-elf/gcc-2.95.3/bin/:$PATH

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

#alias lmli='/home/eda/ic610/tools/bin/lmgrd -c /home/eda/ic610/share/license/license.dat'
#export OA_HOME=/home/eda/ic610/OA
#export CDS_ROOT=/home/eda/ic610
#export MMSIM_ROOT=/home/eda/ic610/mmsim61
#export CDS_LIC_FILE=5281@majian-laptop
#export LM_LICENSE_FILE=$CDS_ROOT/share/license/license.dat
#export CDS_Netlisting_Mode=Analog
#export PATH=$MMSIM_ROOT/tools/bin:$MMSIM_ROOT/tools/spectre/bin:$CDS_ROOT/tools/bin:$CDS_ROOT/tools/dfII/bin:$PATH
#export MOZILLA_HOME=/usr/bin/netscape

##Cadence SPB environment
#export LANG=en
export CDS_AUTO_32BIT ALL
export CDS_INST_DIR=/opt/spb16.3
export CDS_LIC_FILE=/usr/local/flexlm/licenses/license.dat
export CDS_DIR=$CDS_INST_DIR
export CONCEPT_INST_DIR=$CDS_DIR
export CDS_SITE=$CDS_DIR/share/local/
#export LD_LIBRARY_PATH=/lib:/usr/lib:/opt/Cadence_SPB/tools.lnx86/lib:/opt/Cadence_SPB/tools.lnx86/mainwin520/mw/lib-linux_optimized/
export CDSDOC_PROJECT=$CDS_INST_DIR/doc
#export PATH=$PATH:$CDS_INST_DIR/tools.lnx86/jre/bin:$CONCEPT_INST_DIR/tools.lnx86/bin:$CONCEPT_INST_DIR/tools.lnx86/pcb/bin:$CONCEPT_INST_DIR/tools.lnx86/fet/bin:$CONCEPT_INST_DIR/tools.lnx86/specctra/bin/:$CONCEPT_INST_DIR/tools.lnx86/plot/bin:$CONCEPT_INST_DIR/stream_mgt/bin/:$CONCEPT_INST_DIR/tools.lnx86/fet/concept/bin:$CONCEPT_INST_DIR/tools.lnx86/dfII/bin:$CONCEPT_INST_DIR/tools.lnx86/spectre/bin

export LD_LIBRARY_PATH=/opt/nessus/lib:/opt/nessus/lib/nessus:/usr/local/lib:/usr/lib64:$LD_LIBRARY_PATH

export PATH=/usr/lib/git-core/:$PATH
export PATH=/opt/gcc-3.4.6-2f/bin:$PATH
export PATH=/opt/nessus/bin:/opt/nessus/sbin:$PATH
export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_25
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

alias 251='ssh root@192.168.90.251'
