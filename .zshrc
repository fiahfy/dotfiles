setopt noautomenu
#setopt nomenucomplete

autoload -Uz colors && colors
autoload -Uz compinit && compinit -u

PROMPT="%{$fg[cyan]%}[%n@%m:%{$fg[yellow]%}%~%{$fg[cyan]%}]%{$reset_color%} $ "

# zsh-completion
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi


# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# direnv
eval "$(direnv hook zsh)"

# npm
export PATH="`npm prefix -g`/bin:$PATH"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"


alias ls='ls -G'
alias ll='ls -lG'

alias gcd='cd $(ghq list -p | peco)'
alias gcode='code $(ghq list -p | peco)'


[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local
