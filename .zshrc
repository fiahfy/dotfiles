setopt noautomenu
#setopt nomenucomplete

autoload -Uz colors && colors
autoload -Uz compinit && compinit -u

PROMPT="%{$fg[cyan]%}[%n@%m:%{$fg[yellow]%}%~%{$fg[cyan]%}]%{$reset_color%} $ "

if type brew &>/dev/null; then
	# zsh-completion
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	# @see https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

	autoload -Uz compinit
	compinit
fi


# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# direnv
eval "$(direnv hook zsh)"

# npm
export PATH="`npm prefix -g`/bin:$PATH"


alias ls='ls -G'
alias ll='ls -lG'

alias gcd='cd $(ghq list -p | peco)'
alias gcode='code $(ghq list -p | peco)'


[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local
