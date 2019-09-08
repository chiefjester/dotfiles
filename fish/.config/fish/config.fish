alias fd=fdfind

set -gx FZF_DEFAULT_COMMAND 'fd --hidden --exclude .git --exclude node_modules --type f --color=never'
set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never'

fish_ssh_agent

alias tt="du -hsx * | sort -rh | head -10"
