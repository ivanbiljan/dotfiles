#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -alh --color=auto'
alias desk='cd ~/Desktop'
alias pip='sudo pacman -Sy'
PS1='[\u@\h \W]\$ '

# Startup commands
neofetch

# Function declarations
fcd() {
 mkdir -p -- "$1" && cd -P -- "$1"
}
source /home/ivanbiljan/Desktop/Dev/vcpkg/scripts/vcpkg_completion.bash
