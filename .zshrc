autoload -Uz colors && colors
autoload -Uz compinit && compinit

PROMPT="%{$fg[cyan]%}[%n@%m:%{$fg[yellow]%}%~%{$fg[cyan]%}]%{$reset_color%} $ "

if [ `uname` = 'Darwin' ]; then
	alias ls='ls -G'
	alias ll='ls -lG'
else
	alias ls='ls --color=auto'
	alias ll='ls -l --color=auto'
fi


[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

# zsh-completion
fpath=(/usr/local/share/zsh-completions $fpath)
