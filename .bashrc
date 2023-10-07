PS1='\[\033[36m\][\u@\h:\[\033[33m\]\w\[\033[36m\]]\[\033[0m\] \$ '

if [ `uname` = 'Darwin' ]; then
	alias ls='ls -G'
	alias ll='ls -lG'
else
	alias ls='ls --color=auto'
	alias ll='ls -l --color=auto'
fi

# bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local
