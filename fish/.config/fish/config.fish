set -gx PATH $HOME/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $HOME/squashfs-root/usr/bin $HOME/.npm-global/bin /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application $PATH
# alias fd=fdfind
alias npmdelete="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"
alias git=hub
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
# alias xdg-open=wslview
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

set -gx NPM_CONFIG_PREFIX "~/.npm-global"

set -gx GDK_SCALE 2
set -gx QT_SCALE_FACTOR 2
set -gx GDK_DPI_SCALE 2

# set-up gpg
if type -q gpg 
  set -x GPG_TTY (tty)
end

# set DISPLAY variable for WSL2
if uname -a | grep 'microsoft' >/dev/null
  set -gx DISPLAY (grep nameserver /etc/resolv.conf | awk '{print $2}'):0
  # clean up tmp
  if type -q /home/chris/bin/cleanup
    sudo /home/chris/bin/cleanup
  end
end

set -gx VISUAL "/home/chris/bin/nvim.appimage"
set -gx EDITOR $VISUAL

if type -q wslview 
  set -gx BROWSER wslview
end

# use fd for fzf commands
set -gx FZF_DEFAULT_COMMAND 'fd --type f --color=never'
set -gx FZF_OPEN_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never'
set -gx FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CD_COMMAND $FZF_ALT_C_COMMAND
set -gx FZF_CD_WITH_HIDDEN_COMMAND 'fd --type d . --color=never --hidden --exclude .npm --exclude .git'

function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

alias tt="du -hsx * | sort -rh | head -10"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/chris/google-cloud-sdk/path.fish.inc' ]; . '/home/chris/google-cloud-sdk/path.fish.inc'; end
set -gx VOLTA_HOME "/home/chris/.volta"
string match -r ".volta" "$PATH" > /dev/null; or set -gx PATH "$VOLTA_HOME/bin" $PATH
