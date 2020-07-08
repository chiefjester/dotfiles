set -gx PATH $HOME/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $HOME/squashfs-root/usr/bin $HOME/.npm-global/bin /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application $PATH
# alias fd=fdfind
alias npmdelete="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias tmux="tmux -2"
# alias xdg-open=wslview
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

set -gx NPM_CONFIG_PREFIX "~/.npm-global"
/tmp/keyrate/keyrate.exe 300 1

# GDK scale for X11 applications
set -gx GDK_SCALE 2
# set -gx GDK_DPI_SCALE 2
set -gx QT_SCALE_FACTOR 2
set -gx GDK_DPI_SCALING 2

# # set-up gpg
# if type -q gpg 
#   set -x GPG_TTY (tty)
# end

# set -x SSH_AUTH_SOCK $HOME/.ssh/agent.sock
# ss -a | grep -q $SSH_AUTH_SOCK
# if [ $status != 0 ]
#   rm -f $SSH_AUTH_SOCK
#   setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:$HOME/.ssh/wsl2-ssh-pageant.exe >/dev/null 2>&1 &
# end

set -x GPG_AGENT_SOCK $HOME/.gnupg/S.gpg-agent
ss -a | grep -q $GPG_AGENT_SOCK
if [ $status != 0 ]
  rm -rf $GPG_AGENT_SOCK
  setsid nohup socat UNIX-LISTEN:$GPG_AGENT_SOCK,fork EXEC:"$HOME/.ssh/wsl2-ssh-pageant.exe --gpg S.gpg-agent" >/dev/null 2>&1 &
end

# bass source /home/chris/gpg.sh
# /home/chris/bin/gpg-agent-relay.sh &

# set DISPLAY variable for WSL2
if uname -a | grep 'microsoft' >/dev/null
  set -gx DISPLAY (grep nameserver /etc/resolv.conf | awk '{print $2}'):0
  # clean up tmp
  if type -q /home/chris/bin/cleanup
    sudo /home/chris/bin/cleanup
  end
end

set -gx VISUAL nvim
set -gx EDITOR $VISUAL

if type -q wslview 
  set -gx BROWSER wslview
end

# use fd for fzf commands
# set -gx FZF_DEFAULT_COMMAND 'fd --type f --color=never --hidden --exclude ".git"'
set -gx FZF_DEFAULT_COMMAND 'rg --hidden --files'
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

function ...
     cd ../..
end

function ....
     cd ../../..
end

alias tt="du -hsx * | sort -rh | head -10"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/chris/google-cloud-sdk/path.fish.inc' ]; . '/home/chris/google-cloud-sdk/path.fish.inc'; end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
