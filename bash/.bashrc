#!/usr/bin/env bash

# ========================================
# ------------- ~/.bashrc ----------------
# ========================================

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History config
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Locale & keyboard config
export LANG=en_GB.UTF-8
export XKB_DEFAULT_LAYOUT=gb
export XKB_DEFAULT_OPTIONS=ctrl:nocaps


# ========================================
# --------- Development Config -----------
# ========================================

# Set default editor to Vim
VISUAL=vim
export VISUAL EDITOR=vim
export EDITOR

# Set Man pager
export PAGER="less"
export MANPAGER="less"
export MANWIDTH=80

# Plan 9 User Space
if [ -d "$HOME/Documents/Projects/plan9/" ]; then
    export PLAN9=$HOME/Documents/Projects/plan9
    export PATH=$PATH:$PLAN9/bin
fi

# .NET Core development
export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1


# ========================================
# --------- Custom Bash Prompts ----------
# ========================================

# Fedora Default
#export PS1="[\u@\h \W]\\$ "

# Fedora Default with VCS branch
function parse_vcs_branch() {
    # Check Git Branch
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')
    # Check HG Branch
    if [[ "${BRANCH}" == "" ]]; then
        BRANCH=$(hg branch 2> /dev/null | awk '{print " "$1""}')
    fi
    printf "${BRANCH}"
}
export -f parse_vcs_branch
export PS1="[\u@\h \W\[\e[32m\]\`parse_vcs_branch\`\[\e[m\]]\\$ "

# Termux (Android) version of Fedora default
[ "$(uname -o)" == "Android" ] && export PS1="[\W]\\$ "


# ========================================
# -------- Aliases and Functions ---------
# ========================================

alias ls="ls --color=auto"
alias startx="startx; vlock"
alias vi="nvi"
alias nv="nvi"
alias ledger="ledger -f ${HOME}/.ledger/personal.dat"
alias ledger-record="${EDITOR} ${HOME}/.ledger/personal.dat"

