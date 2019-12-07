set -gx PATH $HOME/bin $HOME/go/bin $HOME/squashfs-root/usr/bin $HOME/.npm-global/bin /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application $PATH
alias fd=fdfind
alias npmdelete="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"
alias git=hub
alias xdg-open=wslview

set -gx NPM_CONFIG_PREFIX "~/.npm-global"

set -gx VISUAL "/usr/bin/nvim"
set -gx EDITOR $VISUAL
set -gx BROWSER wslview

# use fd for fzf commands
set -gx FZF_DEFAULT_COMMAND 'fd -L --hidden --exclude .npm --exclude .cargo --exclude .cache --exclude .local --exclude .git --exclude node_modules --type f --color=never'
# set -gx FZF_DEFAULT_COMMAND 'fd --type f --color=never'
set -gx FZF_OPEN_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never'
set -gx FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CD_COMMAND $FZF_ALT_C_COMMAND
set -gx FZF_CD_WITH_HIDDEN_COMMAND 'fd --type d . --color=never --hidden --exclude .npm --exclude .git'

fish_ssh_agent

alias tt="du -hsx * | sort -rh | head -10"
