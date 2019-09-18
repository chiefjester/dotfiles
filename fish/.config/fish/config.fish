set -gx PATH $HOME/squashfs-root/usr/bin $PATH
alias fd=fdfind

set -gx VISUAL "/usr/bin/nvim"
set -gx EDITOR $VISUAL

# use fd for fzf commands
set -gx FZF_DEFAULT_COMMAND 'fd --hidden --exclude .npm --exclude .local --exclude .git --exclude node_modules --type f --color=never'
# set -gx FZF_DEFAULT_COMMAND 'fd --type f --color=never'
set -gx FZF_OPEN_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never'
set -gx FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CD_COMMAND $FZF_ALT_C_COMMAND
set -gx FZF_CD_WITH_HIDDEN_COMMAND 'fd --type d . --color=never --hidden --exclude .npm --exclude .git'

fish_ssh_agent

alias tt="du -hsx * | sort -rh | head -10"
