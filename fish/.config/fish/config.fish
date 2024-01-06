if status is-interactive
    alias npmdelete="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"
    alias gs="git status"
    alias ga="git add ."
    alias gc="git commit"
    alias gp="git push"
    alias tmux="tmux -2"
    alias ,q="exit"
    alias v="vim"
    # Commands to run in interactive sessions can go here
end

set -gx NPM_CONFIG_PREFIX "~/.npm-global"

# set PATH
set -gp PATH "$HOME/.npm-global/bin"
set -gp PATH "$HOME/.local/bin"
set -gp PATH "$HOME/bin"
set -ga PATH "$HOME/.gem/ruby/2.7.0/bin"
set -ga PATH "$HOME/.cargo/bin"
set -ga PATH "$HOME/.fzf/bin"
set -ga PATH "$HOME/bin"
# set -gx DOCKER_HOST unix:///run/user/1000/docker.sock
set -ga PATH "$HOME/go/bin"
set -ga PATH "$HOME/.fly/bin"
set -ga PATH /usr/local/go/bin
set -ga PATH "$HOME/.deno/bin"
set -gx GOPATH "$HOME/go-workspace"

# set editor
set -gx VISUAL vim
set -gx EDITOR vim

# set BROWSER
set -gx BROWSER "powershell.exe /C start"

# init starship and zoxide
starship init fish | source
zoxide init fish | source

# bun
set -gx BUN_INSTALL "/home/heyfoo/.bun"
fish_add_path "/home/heyfoo/.bun/bin"

function fish_hybrid_key_bindings --description \
    "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
        set fish_cursor_default line
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings


function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
    # bind "&&" 'commandline -i "; and"'
    # bind "||" 'commandline -i "; or"'
end
