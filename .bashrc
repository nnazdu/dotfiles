#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias rw='/home/nazdu/.config/scripts/restartwaybar.sh'
alias batterymode='/home/$USER/.config/scripts/battery.sh'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(oh-my-posh init bash --config '/home/nazdu/.config/ohmyposh/nazdu.omp.json')"
