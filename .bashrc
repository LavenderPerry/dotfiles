# Shell options
shopt -s autocd
set -C

# Prompt
source /usr/share/git/git-prompt.sh
PROMPT_COMMAND='GIT_PS1_SHOWDIRTYSTATE=1 \
  GIT_PS1_SHOWSTASHSTATE=1 \
  GIT_PS1_SHOWUNTRACKEDFILES=1 \
  __git_ps1 \
  "\[\e[35m\]\W\[\e[33m\]" \
  " \[\e[3$([ $? -eq 0 ] && echo 2 || echo 1)m\]λ\[\e[0m\] "'

# Git repository greeter
# From https://github.com/o2sh/onefetch/wiki/getting-started#misc
last_repository=
cd() {
	builtin cd "$@" || return
  current_repository=$(git rev-parse --show-toplevel 2> /dev/null)
	if [ "$current_repository" ] && \
	   [ "$current_repository" != "$last_repository" ]; then
		onefetch
	fi
	last_repository=$current_repository
}

# Aliases
# Some are taken from https://gist.github.com/anonymous/a9055e30f97bd19645c2
alias lostfiles="sudo lostfiles"
alias which="command -v"
alias ls="ls -hF --color"
alias la="ls -A"
alias ll="la -l"
alias cp="cp -iv"
alias mv="mv -iv"
alias ln="ln -iv"
alias rm="timeout 3 rm -Iv --one-file-system"
alias chown="chown -c --preserve-root"
alias chmod="chmod -c --preserve-root"
alias chgrp="chgrp -c --preserve-root"
alias grep="grep --color"
alias :q="exit"

# Run fetch
hyfetch
