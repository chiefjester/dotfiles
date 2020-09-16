alias npmdelete="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias tmux="tmux -2"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

set -gx NPM_CONFIG_PREFIX "~/.npm-global"

# set DISPLAY variable for WSL2
if uname -a | grep 'microsoft' >/dev/null
  set -gx DISPLAY (grep nameserver /etc/resolv.conf | awk '{print $2}'):0
  # clean up tmp
  if type -q ~/bin/cleanup
    ~/bin/cleanup
  end
end

# use fd for fzf commands
set -gx FZF_DEFAULT_COMMAND 'rg --hidden --files'
set -gx FZF_OPEN_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never'
set -gx FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CD_COMMAND $FZF_ALT_C_COMMAND
set -gx FZF_CD_WITH_HIDDEN_COMMAND 'fd --type d . --color=never --hidden --exclude .npm --exclude .git'

function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
    # bind "&&" 'commandline -i "; and"'
    # bind "||" 'commandline -i "; or"'
end

function fish_user_key_bindings
  for mode in insert default visual
    bind -M $mode \cf forward-char
  end
end

# based from https://superuser.com/questions/449687/using-cd-to-go-up-multiple-directory-levels/449705
# improve cdf version
function cd_up
  cd (printf "%.s../" (seq $argv))
end

alias 'cd..'='cd_up'

# mkdir before moving
function mvf
  set isFolder (string sub --start=-1 $argv[2])
  if not test -d $argv[2]; and test "$isFolder" = "/"
    mkdir -p -- $argv[2]
  end
  /usr/bin/mv $argv
end

alias tt="du -hsx * | sort -rh | head -10"
alias mov="rsync -av --remove-source-files"
alias vi="vim"

set -ga PATH "$HOME/.fzf/bin"

alias mv='mvf'
alias x='exit'

set -ga PATH "$HOME/.gem/ruby/2.7.0/bin"
set -ga PATH "$HOME/.cargo/bin"
# set -U fish_cursor_default line

# set -x fish_cursor_default line
# set -x fish_cursor_visual line
set -x fish_cursor_insert underscore
# set -x fish_cursor_replace_one underscore

starship init fish | source
zoxide init fish | source
# set -ga PATH "$HOME/.npm-global/bin"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -ga PATH "$HOME/go/bin"
