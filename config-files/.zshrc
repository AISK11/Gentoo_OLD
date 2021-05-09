clear
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


bindkey -v
export KEYTIMEOUT=1

#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history

#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BNo matches for: %d%b' 

export PS1="%B%F{#d00000}%n%f%F{#faa307}@%f%F{#d00000}%m%f %F{#faa307}%~%f %F{#d00000}>%f%b %F{#ffffff}"

bindkey "^[[1~"	beginning-of-line
bindkey "^[[4~"	end-of-line
bindkey "^[[3~"	delete-char
bindkey "^[[7~"	beginning-of-line
bindkey "^[[8~"	end-of-line
bindkey "^[[3~"	delete-char

setopt extendedglob

export HISTSIZE=2000
export HISTFILE="${HOME}/.history"
export SAVEHIST=${HISTSIZE}

alias ls='ls --color=always'
alias ip='ip -c'
alias lightcord='cd ~/Lightcord && npm start &'

# start X
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; 
then 
    doas env-update
    source /etc/profile
    startx
fi

source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
