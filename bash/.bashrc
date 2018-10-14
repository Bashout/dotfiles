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

# Set locale and language
export LANG=en_GB.UTF-8
# export LANG=en_US.UTF-8
# export LC_ALL=POSIX

# Bash Inprovements
shopt -s globstar
shopt -s checkwinsize


# ========================================
# --------- Development Config -----------
# ========================================

# Set default editor to Vim
VISUAL=vim
export VISUAL EDITOR=vim
export EDITOR

# .NET Core development
export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Default applications
export BROWSER="firefox"


# ========================================
# --------- Custom Bash Prompts ----------
# ========================================

# Simple prompt
#export PS1="[\u@\h \W]\$ "

# Prompt displaying VCS branch
function get_vcs_branch() {
    if [ "$(command -v vcs)" ]; then
        VCS_BRANCH=$(vcs -b)
        if [ "$VCS_BRANCH" != "" ]; then
            printf " $VCS_BRANCH"
        fi
    fi
    printf ""
}
export PS1="[\u@\h \W\[\e[0;32m\]\`get_vcs_branch\`\[\e[0;00m\]]\\$ "

# Simplified prompt for Termux (Android)
[ "$(uname -o)" == "Android" ] && export PS1="[\W]\\$ "


# ========================================
# -------- Aliases and Functions ---------
# ========================================

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias pgrep="pgrep --color=auto"
alias ip="ip -color"

alias ledger="ledger -f ${HOME}/.ledger/personal.dat"
alias ledger-record="${EDITOR} ${HOME}/.ledger/personal.dat"
