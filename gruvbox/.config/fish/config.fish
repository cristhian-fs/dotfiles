# Inicialização do Starship
starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH /usr/local/go/bin $PATH

alias tms='tmux-sessionizer'

alias kitty "$HOME/kitty/kitty/launcher/kitty"
funcsave kitty

function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# NVM on fish
set -gx NVM_DIR $HOME/.nvm
bass source $NVM_DIR/nvm.sh ';' nvm use default
